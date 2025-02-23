package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;
import vo.CartitemsVO;
import vo.OrderDetailVO;
import vo.OrderListVO;
import vo.OrdersVO;
import vo.ProductVO;

public class OrdersDAO {

	SqlSession sqlSession;
	
	public OrdersDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//내 장바구니 목록 확인(장바구니에 담고 주문하러왔음) CartDAO에서 가져온 장바구니 목록
	/*
	 * public List<CartVO> select(CartVO vo) { List<CartVO> list =
	 * sqlSession.selectList("c.selectlist", vo); return list; }
	 */
	
	//장바구니번호 추가
	/*
	 * public int insertorder(OrdersVO vo) { int insert =
	 * sqlSession.insert("c.insertorder", vo); return insert; }
	 */
	
	//결제 후 db에 저장
    //public int paymentorder(OrdersVO vo) {
    //    int insert = sqlSession.insert("o.orders_paymentorder", vo);
    //    return insert; 
    //}
    
    public int paymentorder(OrdersVO vo) {
        // 1. 시퀀스를 통해 ordernum 값을 가져옵니다.
        int ordernum = sqlSession.selectOne("o.orders_getnextordernum");

        // 2. OrdersVO 객체에 ordernum을 설정합니다.
        vo.setOrdernum(ordernum);

        // 3. 이제 vo 객체에 이미 설정된 ordernum 값을 사용하여 주문 정보를 삽입합니다.
        int insert = sqlSession.insert("o.orders_paymentorder", vo);
        
        return insert;
    }
    
    //결제 후 orderdetail에 상품 정보를 넣기 위해 장바구니 조회
    public int getcartnum(String memberid) {
    	int cartnum = sqlSession.selectOne("o.orders_getcartnum", memberid);
    	return cartnum;
    }
    
	//주문한 상품의 정보 조회
	public List<CartitemsVO> selectorderitems(int cartnum) {
       List<CartitemsVO> list = sqlSession.selectList("ci.cartitems_selectorderitems", cartnum);
       return list;
    }
	
	//결제 후 상품 상세정보 저장
	public int insertorderdetail(OrderDetailVO vo) {
		int insertorderdetail = sqlSession.insert("od.orderdetail_insert", vo);
		return insertorderdetail;
	}
    
    //orderdetail에서 주문목록 가져오기
	/*
	 * public List<OrderDetailVO> selectorderdetaillist(String memberid) {
	 * List<OrderDetailVO> orderdetail =
	 * sqlSession.selectList("od.orderdetail_list", memberid); return orderdetail; }
	 */
	
	//orders에서 주문목록 가져오기
	public List<OrderListVO> selectorderslist(String memberid) {
		List<OrderListVO> orders = sqlSession.selectList("o.orders_orderlist", memberid);
		return orders;
	}
	
	//product에서 주문목록 가져오기
	/*
	 * public List<ProductVO> selectproductlist(String memberid) { List<ProductVO>
	 * product = sqlSession.selectList("o.product_list", memberid); return product;
	 * }
	 */
		
}
