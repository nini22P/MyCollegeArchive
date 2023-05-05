package io.github.nini22p.forum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "post")
public class Post {

	@Id
	private String postid;
	@Column
	private String postpartition;
	@Column
	private String postuser;
	@Column
	private String posttitle;
	@Column
	private String posttext;
	@Column
	private String posttime;
	@Column
	private String lasttime;
	@Column
	private String postremarks;

	@Column
	public String getPostid() {
		return postid;
	}

	public void setPostid(String postid) {
		this.postid = postid;
	}

	public String getPostpartition() {
		return postpartition;
	}

	public void setPostpartition(String postpartition) {
		this.postpartition = postpartition;
	}

	public String getPostuser() {
		return postuser;
	}

	public void setPostuser(String postuser) {
		this.postuser = postuser;
	}

	public String getPosttitle() {
		return posttitle;
	}

	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}

	public String getPosttext() {
		return posttext;
	}

	public void setPosttext(String posttext) {
		this.posttext = posttext;
	}

	public String getPosttime() {
		return posttime;
	}

	public void setPosttime(String posttime) {
		this.posttime = posttime;
	}

	public String getLasttime() {
		return lasttime;
	}

	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}

	public String getPostremarks() {
		return postremarks;
	}

	public void setPostremarks(String postremarks) {
		this.postremarks = postremarks;
	}

}
