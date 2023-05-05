package io.github.nini22p.forum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "remarks")
public class Remarks {
	@Id
	private String remarksid;
	@Column
	private String remarkspostid;
	@Column
	private String remarksuser;
	@Column
	private String remarkstext;
	@Column
	private String remarkstime;

	@Column
	public String getRemarksid() {
		return remarksid;
	}

	public void setRemarksid(String remarksid) {
		this.remarksid = remarksid;
	}

	public String getRemarkspostid() {
		return remarkspostid;
	}

	public void setRemarkspostid(String remarkspostid) {
		this.remarkspostid = remarkspostid;
	}

	public String getRemarksuser() {
		return remarksuser;
	}

	public void setRemarksuser(String remarksuser) {
		this.remarksuser = remarksuser;
	}

	public String getRemarkstext() {
		return remarkstext;
	}

	public void setRemarkstext(String remarkstext) {
		this.remarkstext = remarkstext;
	}

	public String getRemarkstime() {
		return remarkstime;
	}

	public void setRemarkstime(String remarkstime) {
		this.remarkstime = remarkstime;
	}

}
