package me.ilvc.wenda.model;

import java.sql.Timestamp;
import java.util.List;


public class UserAction {
    private Integer id;

    private Integer qustionId;

    private Integer uid;

    private Integer answerId;

    private Integer type;		// 1：最近提问; 2:最近回答

    private Timestamp addTime;
    
    private List<Question> q4user;
    private List<Answer> a4user;
    private User user;
    

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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserAction(Integer id, Integer qustionId, Integer uid, Integer answerId, Integer type, Timestamp addTime) {
        this.id = id;
        this.qustionId = qustionId;
        this.uid = uid;
        this.answerId = answerId;
        this.type = type;
        this.addTime = addTime;
    }

    public UserAction() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQustionId() {
        return qustionId;
    }

    public void setQustionId(Integer qustionId) {
        this.qustionId = qustionId;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Timestamp getAddTime() {
        return addTime;
    }

    public void setAddTime(Timestamp addTime) {
        this.addTime = addTime;
    }
}