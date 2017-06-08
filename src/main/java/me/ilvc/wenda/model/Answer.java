package me.ilvc.wenda.model;

import java.sql.Timestamp;
import java.util.Date;

public class Answer {
    private Integer answerId;

    private Integer qustionId;

    private String answerContent;

    private Timestamp addTime  = new Timestamp(new Date().getTime());;

    private Integer agreeCount;

    private Integer uid;		//发送人 uid

    private Integer commentCount;

    private Integer huifuUid;		// 回答哪个用户的Id

    private Integer isAccept;		//是否被采纳 0:未采纳， 1：采纳
   
    private User sendUser;
    private User formuser;
    
    private Question a4q;
    private String qtitle;
    private Integer count;
    
    public Question getA4q() {
		return a4q;
	}


	public void setA4q(Question a4q) {
		this.a4q = a4q;
	}


	public String getQtitle() {
		return qtitle;
	}


	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}


	public Answer() {
        super();
    }
     
    
    public Answer(Integer answerId, Integer qustionId, String answerContent, Timestamp addTime, Integer agreeCount,
			Integer uid, Integer commentCount, Integer huifuUid, Integer isAccept, User sendUser, User formuser) {
		super();
		this.answerId = answerId;
		this.qustionId = qustionId;
		this.answerContent = answerContent;
		this.addTime = addTime;
		this.agreeCount = agreeCount;
		this.uid = uid;
		this.commentCount = commentCount;
		this.huifuUid = huifuUid;
		this.isAccept = isAccept;
		this.sendUser = sendUser;
		this.formuser = formuser;
	}


	public Integer getIsAccept() {
		return isAccept;
	}


	public void setIsAccept(Integer isAccept) {
		this.isAccept = isAccept;
	}


	public Integer getCount() {
		return count;
	}


	public void setCount(Integer count) {
		this.count = count;
	}


	public Integer isAccept() {
		return isAccept;
	}

	public void setAccept(Integer isAccept) {
		this.isAccept = isAccept;
	}

	public User getSendUser() {
		return sendUser;
	}

	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}

	public User getFormuser() {
		return formuser;
	}

	public void setFormuser(User formuser) {
		this.formuser = formuser;
	}

    public Integer getAnswerId() {
        return answerId;
    }

	public Timestamp getAddTime() {
		return addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    public Integer getQustionId() {
        return qustionId;
    }

    public void setQustionId(Integer qustionId) {
        this.qustionId = qustionId;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent == null ? null : answerContent.trim();
    }

   
    
    public Integer getAgreeCount() {
        return agreeCount;
    }

    public void setAgreeCount(Integer agreeCount) {
        this.agreeCount = agreeCount;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public Integer getHuifuUid() {
        return huifuUid;
    }

    public void setHuifuUid(Integer huifuUid) {
        this.huifuUid = huifuUid;
    }


	@Override
	public String toString() {
		return "Answer [answerId=" + answerId + ", qustionId=" + qustionId + ", answerContent=" + answerContent
				+ ", addTime=" + addTime + ", agreeCount=" + agreeCount + ", uid=" + uid + ", commentCount="
				+ commentCount + ", huifuUid=" + huifuUid + ", isAccept=" + isAccept + ", sendUser=" + sendUser
				+ ", formuser=" + formuser + ", a4q=" + a4q + ", qtitle=" + qtitle + ", count=" + count + "]";
	}




}