package com.bit.servlet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.servlet.dao.EmailDao;
import com.bit.servlet.dao.EmailDaoOrclImpl;
import com.bit.servlet.dao.EmailVo;

//@WebServlet("/el")	//	현재 클래스를 /el url 패턴에 반응하는 서블릿으로 등록
//	web.xml 에 <servlet>과 <servlet-mapping>을 등록한 것과 동일
@WebServlet(name = "Emaillist", urlPatterns = "/el")
public class EmaillistServlet extends HttpServlet {

	//	doGet Override
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//	View 처리를 위한 RequestDispatcher를 확인
		//	자신이 처리핳고 있던 요청 객체와 응답 객체를
		//	다른 서블릿(JSP)로 전달하여 추가 작업진행
		String action = req.getParameter("a");	//	a 파라미터를 확인
		
		if ("form".equals(action)) {	//	a == form 이면
			//	등록 폼 : 파라미터에서 a를 확임. form이면 분기
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/WEB-INF/views/emaillist/form.jsp");
			rd.forward(req, resp);
		} else if ("delete".equals(action)) {
			//	파라미터 no를 이용, 삭제
			Long no = Long.valueOf(req.getParameter("no"));
			
			EmailDao dao = new EmailDaoOrclImpl();
			dao.delete(no);
			
			//	리스트로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/el");
		} else if ("update_form".equals(action)) {
			RequestDispatcher rd =
					getServletContext().getRequestDispatcher("/WEB-INF/views/emaillist/update_form.jsp");
			rd.forward(req, resp);
		} else {
			//	리스트를 불러와 req에 attribute로 추가
			EmailDao dao = new EmailDaoOrclImpl();
			//	전달해줄 객체 생성
			List<EmailVo> list = dao.getList();
			
			//	요청 객체에 속성으로 추가
			req.setAttribute("list", list); 	//	전달받은 서블릿은 요청으로부터 이 속성을 꺼내 쓸 수 있다.
			
			//	Dispatcher 확보
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/WEB-INF/views/emaillist/index.jsp");
			
			//	요청과 응답 객체 전달
			rd.forward(req, resp);
		}
		
	}

	//	doPost Override
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");	//	히든 필드
		
		if("insert".equals(action)) {	//	action 값이 insert 이면 -> 삽입
			String firstName = req.getParameter("first_name");
			String lastName = req.getParameter("last_name");
			String email = req.getParameter("email");
			
			EmailVo vo = new EmailVo();
			vo.setLastName(lastName);
			vo.setFirstName(firstName);
			vo.setEmail(email);
			
			EmailDao dao = new EmailDaoOrclImpl();
			
			dao.insert(vo);
			
			//	리스트 페이지로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/el");
		} else if("update".equals(action)) {
			
			Long no = Long.valueOf(req.getParameter("no"));
			String lastName = req.getParameter("last_name");
			String firstName = req.getParameter("first_name");
			String email = req.getParameter("email");
			
			EmailVo vo = new EmailVo();
			vo.setLastName(lastName);
			vo.setFirstName(firstName);
			vo.setEmail(email);
			
			EmailDao dao = new EmailDaoOrclImpl();
			dao.update(no, vo);
//			리스트 페이지로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/el");
			
		} else {
			doGet(req, resp);
		}
		
		
	}
	
	
	
}
