package dao;

import java.util.List;

@SuppressWarnings("rawtypes")
public class PageSelect {
	private long count; // 总记录数
	private int pagecount; // 总页数
	private int pagenow = 1; // 当前页数
    private boolean change=false;
	private int size = 5; // 每页最大记录数
	private String search;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	private List list; // 当前页记录

	// 所有属性的Getter和Setter方法
	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public int getPagecount() {
		return pagecount;
	}

	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}

	public int getPagenow() {
		return pagenow;
	}

	public void setPagenow(int pagenow) {
		this.pagenow = pagenow;
	}

	public void pagemore() {
		if (pagenow < pagecount) {
			pagenow++;
		}
	}

	public void pageless() {
		if (pagenow > 1) {
			pagenow--;
		}
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public boolean isChange() {
		return change;
	}

	public void setChange(boolean change) {
		this.change = change;
	}
	

}
