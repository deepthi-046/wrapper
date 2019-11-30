package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Loginbean;
import beans.notifications;

public class notificationsDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// -----------------------START-ACCESSCONNECTION-----------------------------------
	/**
	 *
	 * @author : TecTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: Access Connection
	 * @param :Nothing
	 * 
	 * @return : Connection
	 */

	public static Connection getDbConnection() throws SQLException {

		try {
			DBDao.connect();
			con = DBDao.getDbCon();

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	// -----------------------END-ACCESSCONNECTION-----------------------------------

	// ----------------------START VIEW NOTIFICATIONSs----------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: view notifications
	 * @param :nothing
	 * @see :nothing
	 * @throws:Exception in  case of connection
	 *                      
	 * 
	 * @return : arraylist
	 */
	public static ArrayList<notifications> viewnotifications() throws SQLException {

		ArrayList<notifications> eb = new ArrayList<notifications>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement(
					"select o_name,o_date,c_name,c_destination,tbl_order.o_id from tbl_order,tbl_customer where tbl_order.o_id=tbl_customer.o_id and o_status='new'");
			rs = pst.executeQuery();
			while (rs.next()) {
				notifications noti = new notifications();
				noti.setOname(rs.getString(1));
				noti.setDate(rs.getString(2));
				noti.setCname(rs.getString(3));
				noti.setCdestination(rs.getString(4));
				noti.setO_id(rs.getInt(5));
				eb.add(noti);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}

	// ----------------------END VIEWNOTIFICATIONS----------------

	// ----------------------START UPDATIONS----------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: update orders
	 * @param :nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * 
	 * @return :boolean
	 */
	public static boolean update(notifications noti) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("update tbl_order set O_STATUS='accept' where o_id=?	");
			pst.setInt(1, noti.getO_id());
			pst.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	//-----------------------ENDUPDATION--------------------------
	
	// ----------------------START ALLOTING ORDERS----------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: alloting orders
	 * @param :NOTHING
	 * @see :nothing
	 * @throws:Exception case
	 *                       of connection
	 * @return : arraylist
	 */
	public static ArrayList<notifications> allotOrder() throws SQLException {

		ArrayList<notifications> eb = new ArrayList<notifications>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement(
					"select o_name,o_date,c_name,c_destination,tbl_order.o_id,c_id from tbl_order,tbl_customer where tbl_order.o_id=tbl_customer.o_id and o_status='accept'");
			rs = pst.executeQuery();
			while (rs.next()) {
				notifications noti = new notifications();
				noti.setOname(rs.getString(1));
				noti.setDate(rs.getString(2));
				noti.setCname(rs.getString(3));
				noti.setCdestination(rs.getString(4));
				noti.setO_id(rs.getInt(5));
				noti.setCid(rs.getInt(6));

				eb.add(noti);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}

	// ----------------------END DELETE FEEDBACK FROMDATABASE----------------
	// ----------------------START VIEW employee details----------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: view employee  details
	 * @param :nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : arraylist
	 */
	public static ArrayList<Loginbean> destinationView(String dest) throws SQLException {

		ArrayList<Loginbean> lo = new ArrayList<Loginbean>();

		try {

			con = getDbConnection();
			pst = con.prepareStatement("select u_name,u_id from tbl_user where u_location=? and u_role='employee'");
			pst.setString(1, dest);
			rs = pst.executeQuery();
			while (rs.next()) {
				Loginbean log = new Loginbean();
				log.setUsername(rs.getString(1));
				log.setUid(rs.getInt(2));

				lo.add(log);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lo;

	}

	// ------------------------END -VIEW EMPLOYEE-------------------------------
	// ----------------------START ALLOT EMPLOYEE---------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: alloting employee
	 * @param :NOTHING
	 * @see :nothing
	 * @throws:Exception in case of connection
	 * @return : boolean
	 */
	public static boolean allotemployee(notifications noti) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("insert into tbl_allot(u_id,o_id,c_id) values(?,?,?)");
			pst.setInt(1, noti.getuId());
			pst.setInt(2, noti.getO_id());
			pst.setInt(3, noti.getCid());
			pst.executeUpdate();
			pst=con.prepareStatement("insert into tbl_tracking(o_id,c_id,t_status) values(?,?,'Accepted')");
			pst.setInt(1, noti.getO_id());
			pst.setInt(2, noti.getCid());
			pst.executeUpdate();
			pst = con.prepareStatement("update TBL_ORDER set O_STATUS='allotted' where o_id=?");
			pst.setInt(1, noti.getO_id());
			pst.executeUpdate();

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// ----------------------END alloting employee----------------
	// ---------------------START VIEW CUSTOMERS------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: view customers
	 * @param :NOTHING
	 * @see :nothing
	 * @throws:Exception case  of connection

	 * @return : arraylist
	 */
	public static ArrayList<notifications> viewCustomers() throws SQLException {

		ArrayList<notifications> eb = new ArrayList<notifications>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement(
					"select o_name,o_date,c_name,c_destination,tbl_order.o_id,c_id from tbl_order,tbl_customer where tbl_order.o_id=tbl_customer.o_id");
			rs = pst.executeQuery();
			while (rs.next()) {
				notifications noti = new notifications();
				noti.setOname(rs.getString(1));
				noti.setDate(rs.getString(2));
				noti.setCname(rs.getString(3));
				noti.setCdestination(rs.getString(4));
				noti.setO_id(rs.getInt(5));
				noti.setCid(rs.getInt(6));

				eb.add(noti);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}

	// -------------------------------------end fetch customers list-----------------
	// --------------------------------------DELETE CUSTOMERS-------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: Deleting customers
	 * @param :NOTHING
	 * @see :nothing
	 * @throws:Exception case of connection
	 * @return : arraylist
	 */

	public static boolean deletecustomer(notifications noti) throws SQLException {
		try {

			con = getDbConnection();

			pst = con.prepareStatement("delete from tbl_customer where c_id=?");
			pst.setInt(1, noti.getCid());
			pst.executeUpdate();

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	//--------------------------deleting customers----------------
		// ----------------------START VIEW Feedback details----------------
		/**
		 *
		 * @author : TechTycoons
		 * @date : 12/11/2019
		 * @version: 1.0
		 * @purpose: view employee  details
		 * @param :nothing
		 * @see :nothing
		 * @throws:Exception in
		 *                       case of connection
		 * @return : arraylist
		 */
	public static ArrayList<notifications> displayfeedback()throws Exception{
		 ArrayList<notifications> ub=new ArrayList<notifications>();
			
		  try {
			  con=getDbConnection();
			  pst=con.prepareStatement("select f_comment,f_date from tbl_feedback");
			  rs=pst.executeQuery();
			  
			  while(rs.next()) {
				 
				  notifications fdbkbean=new notifications();
				  	fdbkbean.setComment(rs.getString(1));
				  	fdbkbean.setDate(rs.getString(2));
				  	
				 ub.add(fdbkbean);
				  		
			  }
			  
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		  return ub;
	}
	
	// ----------------------END viewfeedback----------------
		// ----------------------START get customerid----------------
		/**
		 *
		 * @author : TechTycoons
		 * @date : 12/11/2019
		 * @version: 1.0
		 * @purpose: getting the customerid
		 * @param :nothing
		 * @see :nothing
		 * @throws:Exception in
		 *                       case of connection
		 * @return : arraylist
		 */
	public static ArrayList<notifications> getCustomerID(int id) throws SQLException {

		int o_id = 0;
		ArrayList<notifications> al=new ArrayList<notifications>();

		try {
		//ArrayList<NotificationBean> al=new ArrayList<NotificationBean>();

		con = getDbConnection();
		pst = con.prepareStatement("select * from tbl_allot where u_id=?");

		pst.setInt(1, id);

		rs = pst.executeQuery();
		while (rs.next()) {
		notifications notificationBean=new notifications();
		notificationBean.setCid(rs.getInt("c_id"));
		al.add(notificationBean);

		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		return al;

		}
	// ----------------------END getting  customerid----------------
		// ----------------------START VIEW customer details----------------
		/**
		 *
		 * @author : TechTycoons
		 * @date : 12/11/2019
		 * @version: 1.0
		 * @purpose: view customer  details
		 * @param :nothing
		 * @see :nothing
		 * @throws:Exception in
		 *                       case of connection
		 * @return : arraylist
		 */


		public static ArrayList<notifications> viewcustomers(notifications noti) throws SQLException {

		ArrayList<notifications> eb = new ArrayList<notifications>();
		try {
		notifications notificationBean = new notifications();

		con = getDbConnection();
		pst = con.prepareStatement("select * from tbl_customer where c_id=?");
		pst.setInt(1,noti.getCid());
		rs = pst.executeQuery();

		while (rs.next()) {

		notificationBean.setCname(rs.getString(2));
		notificationBean.setO_id(rs.getInt(6));
		notificationBean.setCid(rs.getInt(1));
		eb.add(notificationBean);
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		System.out.print("-----------true----------");
		return eb;

		}
		// ----------------------ENDviewing customerdetails----------------
		
		// ----------------------START insert feedback----------------
		/**
		 *
		 * @author : TechTycoons
		 * @date : 12/11/2019
		 * @version: 1.0
		 * @purpose: insertfeedback
		 * @param :nothing
		 * @see :nothing
		 * @throws:Exception in
		 *                       case of connection
		 * @return : arraylist
		 */
		 
		public static boolean insertFeedback(notifications eq) throws SQLException{
		    
		    try{
		    	 con=getDbConnection();
		    pst=con.prepareStatement("insert into tbl_feedback(f_date,f_comment)values(?,?)");
		    
		    pst.setString(1,eq.getDate());
		    pst.setString(2,eq.getComment());
		    pst.executeUpdate();
		    flag=false;
		} catch(Exception e){
		    e.printStackTrace();
		}
		return flag;
		   
		}
		///////////////////////END-FEEDBACK/////////////////////

		}


