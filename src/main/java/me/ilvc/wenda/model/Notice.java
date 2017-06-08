package me.ilvc.wenda.model;

import java.sql.Timestamp;
import java.util.Date;

public class Notice {
    private Integer noticeId;

    private String noticeContent;

    private Integer sendtoUid;

    private Integer fromtoUid;

    private Timestamp addTime  = new Timestamp(new Date().getTime());;

    private Integer type;

    private Integer answerId;
    
    
    private User sendUser;
    private User formuser;
    
    

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

	public Notice(Integer noticeId, String noticeContent, Integer sendtoUid, Integer fromtoUid, Timestamp addTime, Integer type, Integer answerId) {
        this.noticeId = noticeId;
        this.noticeContent = noticeContent;
        this.sendtoUid = sendtoUid;
        this.fromtoUid = fromtoUid;
        this.addTime = addTime;
        this.type = type;
        this.answerId = answerId;
    }

    public Notice() {
        super();
    }

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent == null ? null : noticeContent.trim();
    }

    public Integer getSendtoUid() {
        return sendtoUid;
    }

    public void setSendtoUid(Integer sendtoUid) {
        this.sendtoUid = sendtoUid;
    }

    public Integer getFromtoUid() {
        return fromtoUid;
    }

    public void setFromtoUid(Integer fromtoUid) {
        this.fromtoUid = fromtoUid;
    }

    public Timestamp getAddTime() {
        return addTime;
    }

    public void setAddTime(Timestamp addTime) {
        this.addTime = addTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }
}