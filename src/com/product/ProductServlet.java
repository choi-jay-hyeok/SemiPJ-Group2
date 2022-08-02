package com.product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.ProductDAO;
import com.product.ProductDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyPage;

public class ProductServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = DBConn.getConnection();
		ProductDAO dao = new ProductDAO(conn);
		
		MyPage myPage = new MyPage();
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		//파일 저장 경로 설정
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "productImage";
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("write.do")!=-1) {
			
			url = "/product/write.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1) {
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr =
					new MultipartRequest(req, path, maxSize, encType,
							new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload")!=null) {
				
				ProductDTO dto= new ProductDTO();
				
				int maxNum = dao.getMaxNum();
				
				dto.setProductNum(maxNum + 1);
				dto.setProductName(mr.getParameter("subject"));
				dto.setImg(mr.getFilesystemName("upload"));
				
				dao.insertData(dto);
			}
			url = cp + "/image/list.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1) {
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getDataCount();
			int numPerPage = 6;
			int totalPage = myPage.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			
			List<ProductDTO> lists = dao.getLists(start, end);
			
			String downloadPath = cp + "/image/download.do";
			String deletePath = cp + "/image/deleted.do";
			
			String imagePath = cp + "/pds/productImage";
			
			String listUrl = cp + "/image/list.do";

			String pageIndexList = 
					myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("currentPage", currentPage);
			
			url = "/product/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("download.do")!=-1) {
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			ProductDTO dto = dao.getReadData(num);
			
			if(dto==null) {
				return;
			}
			
			boolean flag =
					FileManager.doFileDownload(resp, dto.getImg(), path);
			
			if(flag==false) {
	
				resp.setContentType("text/html;charset=UTF-8");
				
				PrintWriter out = resp.getWriter();
				
				out.print("<script type='text/javascript'>");
				out.print("alert('Download Error!!!');");
				out.print("history.back();");
				out.print("</script>");
				
			}
			
		}else if(uri.indexOf("deleted.do")!=-1) {
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			ProductDTO dto = dao.getReadData(num);
			
			//파일삭제
			FileManager.doFileDelete(dto.getImg(), path);
			
			//DB파일정보삭제
			dao.deleteData(num);
			
			url = cp + "/image/list.do";
			resp.sendRedirect(url);
		}
		
	}

		
	

	
	
}
