package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * SQL 基本操作
 * 通过它,可以很轻松的使用 JDBC 来操纵数据库
 */
public class DBHelper {
    public static String driver = "com.mysql.jdbc.Driver"; // 驱动
    // 连接字符串
    public static String url = "jdbc:mysql://localhost:3306/ticket?characterEncoding=UTF-8";
    // 用户名
    public static String user = "root";
    // 密码
    public static String password = "114514";

    // 不允许实例化该类
    private DBHelper() {
    }

    /**
     * 获取一个数据库连接
     * 通过设置类driver / url / user / password这四个静态变量来设置数据库连接属性
     * 
     * @return 数据库连接
     */
    public static Connection getConnection() {
        try {
            // 获取驱动
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        try {
            if (user == null)
                return DriverManager.getConnection(url);
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    /**
     * 获取一个 Statement
     * 该 Statement 已经设置数据集 可以滚动,可以更新
     * 
     * @return 如果获取失败将返回 null,调用时记得检查返回值
     */
    public static Statement getStatement() {
        Connection conn = getConnection();
        if (conn == null) {
            return null;
        }
        try {
            return conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            close(conn);
        }
        return null;
    }

    /**
     * 获取一个 Statement
     * 该 Statement 已经设置数据集 可以滚动,可以更新
     * 
     * @param conn 数据库连接
     * @return 如果获取失败将返回 null,调用时记得检查返回值
     */
    public static Statement getStatement(Connection conn) {
        if (conn == null) {
            return null;
        }
        try {
            return conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            // 设置数据集可以滚动,可以更新
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    /**
     * 获取一个带参数的 PreparedStatement
     * 该 PreparedStatement 已经设置数据集 可以滚动,可以更新
     * 
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return 如果获取失败将返回 null,调用时记得检查返回值
     */
    public static PreparedStatement getPreparedStatement(String cmdText, Object[] cmdParams) {
        Connection conn = getConnection();
        if (conn == null) {
            return null;
        }
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(cmdText, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            int i = 1;
            for (Object item : cmdParams) { // java foreach遍历集合,要求集合类实现Enumeration接口
                pstmt.setObject(i, item);
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            close(conn);
        }
        return pstmt;
    }

    /**
     * 获取一个带参数的 PreparedStatement
     * 该 PreparedStatement 已经设置数据集 可以滚动,可以更新
     * 
     * @param conn      数据库连接
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return 如果获取失败将返回 null,调用时记得检查返回值
     */
    public static PreparedStatement getPreparedStatement(Connection conn, String cmdText, Object[] cmdParams) {
        if (conn == null) {
            return null;
        }
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(cmdText, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            int i = 1;
            for (Object item : cmdParams) {
                pstmt.setObject(i, item);
                i++;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            close(pstmt);
        }
        return pstmt;
    }

    public static List<Object[]> getList(ResultSet rs) throws SQLException {

        List<Object[]> list = new ArrayList<Object[]>();
        if (rs != null) {

            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while (rs.next()) {
                Object[] objects = new Object[columnCount];
                for (int i = 1; i <= columnCount; i++) {

                    objects[i - 1] = rs.getObject(i);

                }
                list.add(objects);
            }
        }
        return list;
    }

    public static List<Object[]> executeQuery(String text) {
        ResultSet rs = null;
        List<Object[]> list = null;
        Statement st = null;
        Connection conn = getConnection();
        if (conn == null) {
            return null;
        }

        try {
            st = conn.createStatement();
            rs = st.executeQuery(text);
            list = getList(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, rs, st, null);
        }
        return list;

    }

    public List<Object[]> executeQuery(String text, Object... params) {
        ResultSet rs = null;
        List<Object[]> list = null;
        PreparedStatement ps = null;
        Connection conn = getConnection();
        if (conn == null) {
            return null;
        }
        try {
            ps = conn.prepareStatement(text);
            if (params != null) {
                int i = 1;
                for (Object obj : params) {
                    ps.setObject(i, obj);
                    i++;
                }
            }
            rs = ps.executeQuery();
            list = getList(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, rs, null, ps);
        }
        return list;
    }

    /**
     * 执行 SQL 语句,返回结果为整型
     * 主要用于执行非查询语句
     * 
     * @param cmdText SQL 语句
     * @return 非负数:正常执行; -1:执行错误; -2:连接错误
     */
    public static int execSql(String cmdText) {
        Statement stmt = getStatement();
        if (stmt == null) {
            return -2;
        }
        int i;
        try {
            i = stmt.executeUpdate(cmdText);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            i = -1;
        }
        close(stmt);
        return i;
    }

    /**
     * 执行 SQL 语句,返回结果为整型
     * 主要用于执行非查询语句
     * 
     * @param cmdText SQL 语句
     * @return 非负数:正常执行; -1:执行错误; -2:连接错误
     */
    public static int execSql(Connection conn, String cmdText) {
        Statement stmt = getStatement(conn);
        if (stmt == null) {
            return -2;
        }
        int i;
        try {
            i = stmt.executeUpdate(cmdText);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            i = -1;
        }
        close(stmt);
        return i;
    }

    /**
     * 执行 SQL 语句,返回结果为整型
     * 主要用于执行非查询语句
     * 
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return 非负数:正常执行; -1:执行错误; -2:连接错误
     */
    public static int execSql(String cmdText, Object[] cmdParams) {
        PreparedStatement pstmt = getPreparedStatement(cmdText, cmdParams);
        if (pstmt == null) {
            return -2;
        }
        int i;
        try {
            i = pstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            i = -1;
        }
        close(pstmt);
        return i;
    }

    /**
     * 执行 SQL 语句,返回结果为整型
     * 主要用于执行非查询语句
     * 
     * @param conn      数据库连接
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return 非负数:正常执行; -1:执行错误; -2:连接错误
     */
    public static int execSql(Connection conn, String cmdText, Object[] cmdParams) {
        PreparedStatement pstmt = getPreparedStatement(conn, cmdText, cmdParams);
        if (pstmt == null) {
            return -2;
        }
        int i;
        try {
            i = pstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            i = -1;
        }
        close(pstmt);
        return i;
    }

    /**
     * 返回结果集的第一行的一列的值,其他忽略
     * 
     * @param cmdText SQL 语句
     * @return
     */
    public static Object execScalar(String cmdText) {
        ResultSet rs = getResultSet(cmdText);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * 返回结果集的第一行的一列的值,其他忽略
     * 
     * @param conn    数据库连接
     * @param cmdText SQL 语句
     * @return
     */
    public static Object execScalar(Connection conn, String cmdText) {
        ResultSet rs = getResultSet(conn, cmdText);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * 返回结果集的第一行的一列的值,其他忽略
     * 
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return
     */
    public static Object execScalar(String cmdText, Object[] cmdParams) {
        ResultSet rs = getResultSet(cmdText, cmdParams);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * 返回结果集的第一行的一列的值,其他忽略
     * 
     * @param conn      数据库连接
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return
     */
    public static Object execScalar(Connection conn, String cmdText, Object[] cmdParams) {
        ResultSet rs = getResultSet(conn, cmdText, cmdParams);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * 返回一个 ResultSet
     * 
     * @param cmdText SQL 语句
     * @return
     */
    public static ResultSet getResultSet(String cmdText) {
        Statement stmt = getStatement();
        if (stmt == null) {
            return null;
        }
        try {
            return stmt.executeQuery(cmdText);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            close(stmt);
        }
        return null;
    }

    /**
     * 返回一个 ResultSet
     * 
     * @param conn
     * @param cmdText SQL 语句
     * @return
     */
    public static ResultSet getResultSet(Connection conn, String cmdText) {
        Statement stmt = getStatement(conn);
        if (stmt == null) {
            return null;
        }
        try {
            return stmt.executeQuery(cmdText);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            close(stmt);
        }
        return null;
    }

    /**
     * 返回一个 ResultSet
     * 
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return
     */
    public static ResultSet getResultSet(String cmdText, Object[] cmdParams) {
        PreparedStatement pstmt = getPreparedStatement(cmdText, cmdParams);
        if (pstmt == null) {
            return null;
        }
        try {
            return pstmt.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            close(pstmt);
        }
        return null;
    }

    /**
     * 返回一个 ResultSet
     * 
     * @param conn      数据库连接
     * @param cmdText   需要 ? 参数的 SQL 语句
     * @param cmdParams SQL 语句的参数表
     * @return
     */
    public static ResultSet getResultSet(Connection conn, String cmdText, Object[] cmdParams) {
        PreparedStatement pstmt = getPreparedStatement(conn, cmdText, cmdParams);
        if (pstmt == null) {
            return null;
        }
        try {
            return pstmt.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            close(pstmt);
        }
        return null;
    }

    public static Object getScalar(ResultSet rs) {
        if (rs == null) {
            return null;
        }
        Object obj = null;
        try {
            if (rs.next()) {
                obj = rs.getObject(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return obj;
    }

    private static void close(Object obj) {
        if (obj == null) {
            return;
        }
        try {
            if (obj instanceof Statement) {
                ((Statement) obj).close();
            } else if (obj instanceof PreparedStatement) {
                ((PreparedStatement) obj).close();
            } else if (obj instanceof ResultSet) {
                ((ResultSet) obj).close();
            } else if (obj instanceof Connection) {
                ((Connection) obj).close();
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    private static void closeAll(Connection conn, ResultSet rs, Statement st, PreparedStatement ps) {
        close(st);
        close(ps);
        close(rs);
        close(conn);
    }

}
