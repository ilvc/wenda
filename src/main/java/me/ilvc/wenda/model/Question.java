package me.ilvc.wenda.model;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class Question {
	
	
    private Integer questionId;

    private String questionTiltle;

    private Integer publishedUid;

    private Timestamp addTime  = new Timestamp(new Date().getTime());;

    private Timestamp updateTime  = new Timestamp(new Date().getTime());;

    private Integer anwerCount;

    private Integer viewCount;

    private Integer categoryId;

    private String questionContent;
    
    private Integer isStick;
    
    private Integer isJing;
    
    private Integer isAccept;
    
    

	// question 中 包含的 其他实体 
    private User user;
    private List<Tags> qTags;
	private Category qCategory;
  //  private Category qCategory;
    private List<Answer> qAnswer;
    
	
    public List<Answer> getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(List<Answer> qAnswer) {
		this.qAnswer = qAnswer;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Tags> getqTags() {
		return qTags;
	}

	public void setqTags(List<Tags> qTags) {
		this.qTags = qTags;
	}

	public Category getqCategory() {
		return qCategory;
	}

	public void setqCategory(Category qCategory) {
		this.qCategory = qCategory;
	}

	public Question() {
        super();
    }
    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getQuestionTiltle() {
        return questionTiltle;
    }

    public void setQuestionTiltle(String questionTiltle) {
        this.questionTiltle = questionTiltle == null ? null : questionTiltle.trim();
    }

    public Integer getPublishedUid() {
        return publishedUid;
    }

    public void setPublishedUid(Integer publishedUid) {
        this.publishedUid = publishedUid;
    }

    public Timestamp getAddTime() {
        return addTime;
    }

    public void setAddTime(Timestamp addTime) {
        this.addTime = addTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getAnwerCount() {
        return anwerCount;
    }

    public void setAnwerCount(Integer anwerCount) {
        this.anwerCount = anwerCount;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

   

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent == null ? null : questionContent.trim();
    }

	public Integer getIsStick() {
		return isStick;
	}

	public void setIsStick(Integer isStick) {
		this.isStick = isStick;
	}

	public Integer getIsJing() {
		return isJing;
	}

	public void setIsJing(Integer isJing) {
		this.isJing = isJing;
	}

	public Integer getIsAccept() {
		return isAccept;
	}

	public void setIsAccept(Integer isAccept) {
		this.isAccept = isAccept;
	}

	

	
	
	
	public Question(Integer questionId, String questionTiltle, Integer publishedUid, Timestamp addTime,
			Timestamp updateTime, Integer anwerCount, Integer viewCount, Integer categoryId, String questionContent,
			Integer isStick, Integer isJing, Integer isAccept, User user, List<Tags> qTags, Category qCategory,
			List<Answer> qAnswer) {
		super();
		this.questionId = questionId;
		this.questionTiltle = questionTiltle;
		this.publishedUid = publishedUid;
		this.addTime = addTime;
		this.updateTime = updateTime;
		this.anwerCount = anwerCount;
		this.viewCount = viewCount;
		this.categoryId = categoryId;
		this.questionContent = questionContent;
		this.isStick = isStick;
		this.isJing = isJing;
		this.isAccept = isAccept;
		this.user = user;
		this.qTags = qTags;
		this.qCategory = qCategory;
		this.qAnswer = qAnswer;
	}

	public Question(Integer anwerCount,Integer viewCount) {
		super();
		this.anwerCount = anwerCount;
		this.viewCount = viewCount;
	}

	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", questionTiltle=" + questionTiltle + ", publishedUid="
				+ publishedUid + ", addTime=" + addTime + ", updateTime=" + updateTime + ", anwerCount=" + anwerCount
				+ ", viewCount=" + viewCount + ", categoryId=" + categoryId + ", questionContent=" + questionContent
				+ ", isStick=" + isStick + ", isJing=" + isJing + ", isAccept=" + isAccept + ", user=" + user
				+ ", qTags=" + qTags + ", qCategory=" + qCategory + ", qAnswer=" + qAnswer + "]";
	}

	public Question(Integer isStick, Integer isJing, Integer isAccept) {
		super();
		this.isStick = isStick;
		this.isJing = isJing;
		this.isAccept = isAccept;
	}



	


	
}