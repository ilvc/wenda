package me.ilvc.wenda.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


public class User {
    private Integer uid;		

    private String username;

    private String password;

    private String email;
    
    private Integer sex;			//性别

    private String city;			//所在城市

    private String signature;		//个性签名

    private String avtar;

    private Timestamp jointime = new Timestamp(new Date().getTime());

    private Timestamp lastlogintime= new Timestamp(new Date().getTime());

    private Integer onlinetime;

    private Integer count;	//用户回答次数
    
    private Integer isActivate;	 //是否激活邮箱
    
    private List<Question> q4user;
    private List<Answer> a4user;
    
	public Integer getCount() {
		return count;
	}

	public List<Question> getQ4user() {
		return q4user;
	}

	public void setQ4user(List<Question> q4user) {
		this.q4user = q4user;
	}

	public List<Answer> getA4user() {
		return a4user;
	}

	public void setA4user(List<Answer> a4user) {
		this.a4user = a4user;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public User(Integer uid, String username, String password, String email, Integer sex, String city, String signature,
			String avtar, Timestamp jointime, Timestamp lastlogintime, Integer onlinetime) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.sex = sex;
		this.city = city;
		this.signature = signature;
		this.avtar = avtar;
		this.jointime = jointime;
		this.lastlogintime = lastlogintime;
		this.onlinetime = onlinetime;
	}

	public Timestamp getJointime() {
		return jointime;
	}

	public void setJointime(Timestamp jointime) {
		this.jointime = jointime;
	}

	public Timestamp getLastlogintime() {
		return lastlogintime;
	}

	public void setLastlogintime(Timestamp lastlogintime) {
		this.lastlogintime = lastlogintime;
	}

	public Integer getOnlinetime() {
		return onlinetime;
	}

	public void setOnlinetime(Integer onlinetime) {
		this.onlinetime = onlinetime;
	}

	
	
	public User(Integer uid, String username, String email) {
		super();
		this.uid = uid;
		this.username = username;
		this.email = email;
	}

	public User(String password, String email) {
		super();
		this.password = password;
		this.email = email;
	}

	public User() {
        super();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature == null ? null : signature.trim();
    }

    public String getAvtar() {
        return avtar;
    }

    public void setAvtar(String avtar) {
        this.avtar = avtar == null ? null : avtar.trim();
    }

	public Integer getIsActivate() {
		return isActivate;
	}

	public void setIsActivate(Integer isActivate) {
		this.isActivate = isActivate;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", email=" + email + ", sex="
				+ sex + ", city=" + city + ", signature=" + signature + ", avtar=" + avtar + ", jointime=" + jointime
				+ ", lastlogintime=" + lastlogintime + ", onlinetime=" + onlinetime + ", count=" + count
				+ ", isActivate=" + isActivate + ", q4user=" + q4user + ", a4user=" + a4user + "]";
	}

	



	

    
   

	

  
}