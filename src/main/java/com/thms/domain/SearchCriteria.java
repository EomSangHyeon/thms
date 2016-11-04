package com.thms.domain;

public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword;

	//Getter
	public String getSearchType() {
		return searchType;
	}
	public String getKeyword() {
		return keyword;
	}

	//Setter
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return super.toString() +" SearchCriteria [searchType="+ searchType +", keyword="+ keyword +"]";
	}
}
