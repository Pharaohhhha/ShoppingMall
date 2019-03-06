package com.dio.guimei.vo;

public class Page<T> {
	//预定常量：每页的行数
	public static final int R5 = 5;
	public static final int R10 = 10;
	public static final int R15 = 15; 
	public static final int R20 = 20; 
	public static final int R50 = 50;

	//总行数
	private int totalRow = 0;
	//当前页号
	private int pageNo = 1;
	//每页的记录数
	public int pageSize = R5;
	//总页数
	private int totalPage = 0;
	
	private boolean previous;

	//是否有下一页
	private boolean next;

	//是否是第一页
	private boolean first;

	//是否是最后一页
	private boolean last;

	//本页数据首条记录索引  每页10, 当前2页:11~20
	private int firstIndex;

	//本页数据最后条记录索引
	private int lastIndex;

	//查询条件
	private T queryObject;


	public Page(){
		this(0);
	}

	/**
	 * @param totalRow 总记录数
	 */
	public Page(int totalRow){ // 101
		this.totalRow = totalRow;
		setTotalRow(totalRow);
	}

	/**
	 * @param queryObject 查询条件
	 */
	public Page(T queryObject){
		this.queryObject = queryObject;
	}

	/**
	 * @param totalRow		总记录数
	 * @param queryObject	查询条件
	 */
	public Page(int totalRow, T queryObject){
		setTotalRow(totalRow);
		this.queryObject = queryObject;
	}


	/**得到总记录数
	 * @return
	 */
	public int getTotalRow() {
		return totalRow;
	}

	/**
	 * 自动算出页数
	 * @param totalRow
	 */
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		//算出总页数
		if (totalRow%pageSize == 0) {
			this.totalPage = totalRow/pageSize;
		}else{
			this.totalPage = totalRow/pageSize + 1;
		}
	}

	/**
	 * 得到当前的页号
	 * @return
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * 得到下一页的页号
	 * @return
	 */
	public int getNextNo() {
		if (this.getNext()) {
			return pageNo + 1;
		}else{
			return totalPage;
		}
	}

	/**
	 * 得到上一页的页号
	 * @return
	 */
	public int getPrevNo() {
		if (this.getPrevious()) {
			return pageNo -1;
		}else{
			return pageNo;
		}
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * 得到每页显示的记录数
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 得到总页数
	 * @return
	 */
	public int getTotalPage() {
		if (totalRow%pageSize == 0) {
			this.totalPage = totalRow/pageSize;
		}else{
			this.totalPage = totalRow/pageSize + 1;
		}
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * 是否有下一页
	 * @return
	 */
	public boolean getNext(){
		if (pageNo == 1 && pageNo < getTotalPage()) {
			return true;
		}
		if (pageNo >1 && pageNo < getTotalPage()) {
			return true;
		}else  {
			return false;
		}
	}

	/**
	 * 是否有上一页
	 * @return
	 */
	public boolean getPrevious(){
		if (getPageNo() > 1) {
			return true;
		}else {
			return false;
		}
	}

	/**是否是第一页
	 * @return
	 */
	public boolean getFirst() {
		return (getPageNo()>1 ? false : true);
	}

	/**
	 * 是否是最后一页
	 * @return
	 */
	public boolean getLast() {
		return (getPageNo()==getTotalPage() ? true : false);
	}


	/**
	 * 得到本页数据首条记录索引
	 * @return
	 */
	public int getFirstIndex(){
		int i = getPageNo(); //pageNo = 3
		return ((i<1?1:i)-1)*getPageSize()+1;
	}

	/**
	 * 得到本页数据最后一条记录索引
	 * @return 
	 */
	public int getLastIndex() {
//		return getPageNo()*getPageSize();
		return getFirstIndex()+this.getPageSize()-1;
	}

	/**
	 * 得到查询分页的条件
	 * @return
	 */
	public T getQueryObject() {
		return queryObject;
	}

	/**
	 * 设置查询分页的条件
	 * @return
	 */
	public void setQueryObject(T queryObject) {
		this.queryObject = queryObject;
	}

	//便于调试
	@Override
	public String toString() {
		return "Page [是否是第一页:" + getFirst() 
				+ ", 是否是最后页:" + getLast() 
				+ ", 是否有上一页:" + getPrevious()
				+ ", 是否有下一页:" + getNext()
				+ ",   当前的页号:" + getPageNo() 
				+ ",   每页记录数:" + getPageSize()
				+ ", 总页数=" + getTotalPage() 
				+ ", 总记录数=" + getTotalRow() + "]";
	}
	
	public static void main(String[] args) {

		Page page = new Page<>(11);
		//设置 默认每页显示的记录数
		page.setPageSize(Page.R5);
		
		page.setPageNo(3);
		
		System.out.println(page);
	}
}
