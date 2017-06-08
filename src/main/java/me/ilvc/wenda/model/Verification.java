package me.ilvc.wenda.model;

public class Verification {
    private Integer id;

    private String qkey;

    private String qvalue;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQkey() {
		return qkey;
	}

	public void setQkey(String qkey) {
		this.qkey = qkey;
	}

	public String getQvalue() {
		return qvalue;
	}

	public void setQvalue(String qvalue) {
		this.qvalue = qvalue;
	}

	public Verification(Integer id, String qkey, String qvalue) {
		super();
		this.id = id;
		this.qkey = qkey;
		this.qvalue = qvalue;
	}

	@Override
	public String toString() {
		return "Verification [id=" + id + ", qkey=" + qkey + ", qvalue=" + qvalue + "]";
	}

	public Verification(Integer id, String qkey) {
		super();
		this.id = id;
		this.qkey = qkey;
	}

  
    
}