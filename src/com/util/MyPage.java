package com.util;

public class MyPage {

	//전체 페이지의 갯수
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;//34/3
		
		if(dataCount % numPerPage != 0) {
			pageCount++;
		}
		return pageCount;
	}
	//페이징 처리 메소드
	public String pageIndexList(int currentPage,int totalPage,String listUrl) {
	
		int numPerBlock = 5; //◀이전 6 7 8 9 10 다음▶
		int currentPageSetup;
		int page; //for문 i
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0||totalPage==0) {
			return"";
		}
		//돌아가는 주소
		//list.jsp
		//list.jsp>searchKey=subject&searchValue=111
		if(listUrl.indexOf("?")!=-1) {
			listUrl = listUrl + "&";
			//list.jsp>searchKey=subject&searchValue=111&pageNum=3
		}else {
			listUrl = listUrl + "?";
			//list.jsp?pageNum=3
		}
		// 1 2 3 4 5 다음▶
		//◀이전 6 7 8 9 10 다음▶
		//◀이전 11 12 13 14 15 다음▶
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; 
		
		if(currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		//◀이전
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl + "pageNum="
					+ currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
		}
		// 1 2 3 4 5 다음▶
		//◀이전 6 7 8 9 10 다음▶
		//◀이전 11 12 13 14 15 다음▶
		
		//바로가기 페이지
		page = currentPageSetup + 1;
		
		while(page<=totalPage && page <= (currentPageSetup + numPerBlock)) {
			if(page==currentPage) {
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color = "Fuchsia">9</font>&nbsp;
			}else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">"
						+ page + "</a>&nbsp;");
				//<a href=list.jsp?pageNum=2">2</a>&nbsp;
			}			
			page++;
		}
		//◀이전 6 7 8 9 10 다음▶
		//◀이전 11 12
		if(totalPage-currentPageSetup>numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page +
					"\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">다음▶</a>&nbsp;
		}
		return sb.toString();
	}
	
}
