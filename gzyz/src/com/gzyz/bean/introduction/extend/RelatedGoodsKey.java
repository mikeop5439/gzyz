package com.gzyz.bean.introduction.extend;

public class RelatedGoodsKey {
	private String keywords;
	private int firstnum;
	private int secondnum;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getFirstnum() {
		return firstnum;
	}
	public void setFirstnum(int firstnum) {
		this.firstnum = firstnum;
	}
	public int getSecondnum() {
		return secondnum;
	}
	public void setSecondnum(int secondnum) {
		this.secondnum = secondnum;
	}
	@Override
	public String toString() {
		return "RelatedGoodsKey [keywords=" + keywords + ", firstnum="
				+ firstnum + ", secondnum=" + secondnum + "]";
	}
	
}
