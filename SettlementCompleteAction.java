package com.internousdev.i1810a.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.i1810a.dao.CartInfoDAO;
import com.internousdev.i1810a.dao.PurchaseHistoryInfoDAO;
import com.internousdev.i1810a.dto.CartInfoDTO;
import com.internousdev.i1810a.dto.PurchaseHistoryInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SettlementCompleteAction extends ActionSupport implements SessionAware{

	private String id;
	private String categoryId;
	private Map<String, Object> session;
	private String userId;

	public String execute() {
		String result = ERROR;

		@SuppressWarnings("unchecked")
		ArrayList<PurchaseHistoryInfoDTO> purchaseHistoryInfoDtoList = (ArrayList<PurchaseHistoryInfoDTO>)session.get("purchaseHistoryInfoDtoList");
		if(purchaseHistoryInfoDtoList == null){
			return "injustice";
		}
		if(!(session.get("userId") == null)){
			userId = session.get("userId").toString();
		}
		PurchaseHistoryInfoDAO purchaseHistoryInfoDAO = new PurchaseHistoryInfoDAO();

		int count = 0;
		for(int i=0; i<purchaseHistoryInfoDtoList.size();i++) {
			count += purchaseHistoryInfoDAO.regist(userId,
					purchaseHistoryInfoDtoList.get(i).getProductId(),
					purchaseHistoryInfoDtoList.get(i).getProductCount(),
					Integer.valueOf(id),
					purchaseHistoryInfoDtoList.get(i).getSubtotal()
					);
		}
		if(count > 0) {
			CartInfoDAO cartInfoDAO = new CartInfoDAO();
			if(count > 0) {
			count = cartInfoDAO.deleteAll(userId);
				List<CartInfoDTO> cartInfoDtoList = new ArrayList<CartInfoDTO>();
				cartInfoDtoList = cartInfoDAO.getCartInfoDtoList(userId);
				Iterator<CartInfoDTO> iterator = cartInfoDtoList.iterator();
				if(!(iterator.hasNext())) {
					cartInfoDtoList = null;
				}
				session.put("cartInfoDtoList", cartInfoDtoList);

				int totalPrice = Integer.parseInt(String.valueOf(cartInfoDAO.getTotalPrice(userId)));
				session.put("totalPrice", totalPrice);
				result = SUCCESS;
			}
		}
		return result;
	}
	public String getId() {
	return id;
	}
	public void setId(String id) {
	this.id = id;
	}
	public String getCategoryId() {
	return categoryId;
	}
	public void setCategoryId(String categoryId) {
	this.categoryId = categoryId;
	}
	public Map<String, Object> getSession() {
	return session;
	}
	public void setSession(Map<String, Object> session) {
	this.session = session;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
