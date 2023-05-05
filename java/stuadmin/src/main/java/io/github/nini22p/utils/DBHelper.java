package io.github.nini22p.utils;

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
 * SQL ��������
 * ͨ����,���Ժ����ɵ�ʹ�� JDBC ���������ݿ�
 */
public class DBHelper {
    public static String driver = "com.mysql.jdbc.Driver"; // ����
    // �����ַ���
    public static String url = "jdbc:mysql://localhost:3306/stuadmin?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
    // �û���
    public static String user = "root";
    // ����
    public static String password = "114514";

    // ������ʵ��������
    private DBHelper() {
    }

    /**
     * ��ȡһ�����ݿ�����
     * ͨ��������driver / url / user /
     * password���ĸ���̬�������������ݿ���������
     * 
     * @return ���ݿ�����
     */
    public static Connection getConnection() {
        try {
            // ��ȡ����
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
     * ��ȡһ�� Statement
     * �� Statement �Ѿ��������ݼ� ���Թ���,���Ը���
     * 
     * @return �����ȡʧ�ܽ�����? null,����ʱ�ǵü�鷵���?
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
     * ��ȡһ�� Statement
     * �� Statement �Ѿ��������ݼ� ���Թ���,���Ը���
     * 
     * @param conn ���ݿ�����
     * @return �����ȡʧ�ܽ�����? null,����ʱ�ǵü�鷵���?
     */
    public static Statement getStatement(Connection conn) {
        if (conn == null) {
            return null;
        }
        try {
            return conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            // �������ݼ����Թ���,���Ը���
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    /**
     * ��ȡһ���������� PreparedStatement
     * �� PreparedStatement �Ѿ��������ݼ� ���Թ���,���Ը���
     * 
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
     * @return �����ȡʧ�ܽ�����? null,����ʱ�ǵü�鷵���?
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
            for (Object item : cmdParams) { // java foreach��������,Ҫ�󼯺���ʵ��Enumeration�ӿ�
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
     * ��ȡһ���������� PreparedStatement
     * �� PreparedStatement �Ѿ��������ݼ� ���Թ���,���Ը���
     * 
     * @param conn      ���ݿ�����
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
     * @return �����ȡʧ�ܽ�����? null,����ʱ�ǵü�鷵���?
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
     * ִ�� SQL ���?,���ؽ��Ϊ����?
     * ��Ҫ����ִ�зǲ�ѯ���?
     * 
     * @param cmdText SQL ���?
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
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
     * ִ�� SQL ���?,���ؽ��Ϊ����?
     * ��Ҫ����ִ�зǲ�ѯ���?
     * 
     * @param cmdText SQL ���?
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
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
     * ִ�� SQL ���?,���ؽ��Ϊ����?
     * ��Ҫ����ִ�зǲ�ѯ���?
     * 
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
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
     * ִ�� SQL ���?,���ؽ��Ϊ����?
     * ��Ҫ����ִ�зǲ�ѯ���?
     * 
     * @param conn      ���ݿ�����
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
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
     * ���ؽ�����ĵ�һ�е�һ�е��?,��������
     * 
     * @param cmdText SQL ���?
     * @return
     */
    public static Object execScalar(String cmdText) {
        ResultSet rs = getResultSet(cmdText);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * ���ؽ�����ĵ�һ�е�һ�е��?,��������
     * 
     * @param conn    ���ݿ�����
     * @param cmdText SQL ���?
     * @return
     */
    public static Object execScalar(Connection conn, String cmdText) {
        ResultSet rs = getResultSet(conn, cmdText);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * ���ؽ�����ĵ�һ�е�һ�е��?,��������
     * 
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
     * @return
     */
    public static Object execScalar(String cmdText, Object[] cmdParams) {
        ResultSet rs = getResultSet(cmdText, cmdParams);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * ���ؽ�����ĵ�һ�е�һ�е��?,��������
     * 
     * @param conn      ���ݿ�����
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
     * @return
     */
    public static Object execScalar(Connection conn, String cmdText, Object[] cmdParams) {
        ResultSet rs = getResultSet(conn, cmdText, cmdParams);
        Object obj = getScalar(rs);
        close(rs);
        return obj;
    }

    /**
     * ����һ�� ResultSet
     * 
     * @param cmdText SQL ���?
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
     * ����һ�� ResultSet
     * 
     * @param conn
     * @param cmdText SQL ���?
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
     * ����һ�� ResultSet
     * 
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
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
     * ����һ�� ResultSet
     * 
     * @param conn      ���ݿ�����
     * @param cmdText   ��Ҫ ? ������ SQL ���?
     * @param cmdParams SQL ���Ĳ�����
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
