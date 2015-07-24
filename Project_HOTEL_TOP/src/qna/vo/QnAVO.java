package qna.vo;

import java.util.Date;

public class QnAVO {
	private int num;
	private String type;
	private String title;
	private String name;
	private String content;
	private Date nalja;
	private int hit;
	private int secret;
	private String reply;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getNalja() {
		return nalja;
	}
	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	@Override
	public String toString() {
		return "QnAVO [num=" + num + ", type=" + type + ", title=" + title
				+ ", name=" + name + ", content=" + content + ", nalja="
				+ nalja + ", hit=" + hit + ", secret=" + secret + ", reply="
				+ reply + "]";
	}
}
