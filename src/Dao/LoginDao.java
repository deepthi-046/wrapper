package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import beans.Loginbean;
import beans.notifications;

public class LoginDao {

	static Connection con = null;
	static PreparedStatement pst = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static boolean flag = false;
	static int id = 0;

	// -----------------------START-ACCESSCONNECTION-----------------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: Access Connection
	 * @param :
	 *            Nothing
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
	// -----------------------Checking------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: validation
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : Connection
	 */

	public static String check(Loginbean loginBean) throws SQLException {

		String rol = "";

		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tbl_user where u_name=? and u_password=?");
			pst.setString(1, loginBean.getUsername());
			pst.setString(2, loginBean.getPassword());
			rs = pst.executeQuery();
			while (rs.next()) {
				rol = rs.getString("u_role");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rol;

	}

	// --------------------------------------------END
	// CHECKING--------------------------------------------------------------
	// ---------------------------------------------RETURN
	// USERID---------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 13/11/2019
	 * @version: 1.0
	 * @purpose: return id
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : integer
	 */

	public static Integer returnId(Loginbean loginBean) throws SQLException {

		int id = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select * from tbl_user where u_name=? and u_password=?");
			pst.setString(1, loginBean.getUsername());
			pst.setString(2, loginBean.getPassword());
			rs = pst.executeQuery();
			while (rs.next()) {
				id = rs.getInt("u_id");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;

	}
	// --------------------------------------END RETURN
	// ID--------------------------------

	// -----------------------PASSWORD
	// UPDATE--------------------------------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 13/11/2019
	 * @version: 1.0
	 * @purpose: password update
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : boolean
	 */

	public static boolean passwordupdate(Loginbean loginBean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("update tbl_user set u_password=? where u_name=?");

			pst.setString(1, loginBean.getPassword());
			pst.setString(2, loginBean.getUsername());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// -----------------------------Update
	// employee---------------------------------------
	/**
	 * @author : TechTycoons
	 * @date : 14/11/2019
	 * @version: 1.0
	 * @purpose: employee updation
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : boolean
	 */

	public static boolean employeeUpdate(Loginbean loginBean) throws SQLException {

		try {

			con = getDbConnection();
			String location = loginBean.getLocation();
			String name = loginBean.getUsername();
			pst = con.prepareStatement("update tbl_user set u_location='" + location + "' where u_name='" + name + "'");
			// LoginBean loginBean1=new LoginBean();
			// pst.setString(1,);

			pst.executeUpdate();
			System.out.println(loginBean.getLocation());
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// ------------------------------END UPADTION---------------------
	// -----------------------------Update
	// employee---------------------------------------
	/**
	 * @author : TechTycoons
	 * @date : 15/11/2019
	 * @version: 1.0
	 * @purpose: employee deletion
	 * @param :
	 *            reference of enquiryBean
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : boolean
	 */

	public static boolean employeeDelete(Loginbean loginBean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("delete from tbl_user where u_name=?");

			pst.setString(1, loginBean.getUsername());

			pst.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// -----------------------------employee
	// deletion---------------------------------------
	/**
	 * @author : TechTycoons
	 * @date : 14/11/2019
	 * @version: 1.0
	 * @purpose: validation
	 * @param :
	 *            NOTHING
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : Rssultset
	 */

	public static ResultSet checking(Loginbean loginBean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement(
					"select c_username,c_password from TBL_CUSTOMER where c_username=? and c_password=?");
			pst.setString(1, loginBean.getUsername());
			pst.setString(2, loginBean.getPassword());

			rs = pst.executeQuery();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// ------------------------------------------End-validation------------------------------
	// ------------------------------------------GETUSERNAME---------------------------------
	/**
	 * @author : TechTycoons
	 * @date : 15/11/2019
	 * @version: 1.0
	 * @purpose: Getusername
	 * @param :
	 *            NOTHING
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : String
	 */
	public static String getUserName(Loginbean obj) throws ClassNotFoundException, SQLException {
		System.out.println(obj.getUsername() + "****" + obj.getPassword());

		String customername = "";
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select c_name from tbl_customer where c_username=? and c_password=?");
			pst.setString(1, obj.getUsername());
			pst.setString(2, obj.getPassword());
			rs = pst.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getString("c_name") + "****");

				customername = rs.getString("c_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return customername;
	}

	// -------------------------------END
	// GETUSERNAME--------------------------------
	// -------------------------------GET USER
	// ID--------------------------------
	/**
	 * @author : TechTycoons
	 * @date : 14/11/2019
	 * @version: 1.0
	 * @purpose: validation
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : Rssultset
	 */
	public static int getUserId(Loginbean obj) throws ClassNotFoundException, SQLException {
		int cid = 0;
		con = getDbConnection();
		pst = con.prepareStatement("select c_id from tbl_customer where c_username=? and c_password=?");
		pst.setString(1, obj.getUsername());
		pst.setString(2, obj.getPassword());
		rs = pst.executeQuery();
		while (rs.next()) {
			cid = rs.getInt(1);
		}
		return cid;

	}

	// -------------------------------END
	// GETUSERNAME--------------------------------
	// -------------------------------GET USER
	// ID--------------------------------
	/**
	 * @author : TechTycoons
	 * @date : 14/11/2019
	 * @version: 1.0
	 * @purpose: validation
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : ArrayList
	 */
	public static ArrayList<Loginbean> displayPastOrder(int cid) throws ClassNotFoundException, SQLException {

		ArrayList<Loginbean> lst = new ArrayList<Loginbean>();
		con = getDbConnection();
		pst = con.prepareStatement("select * from tbl_order where o_status='delivered'");
		// pst.setInt(1,cid);
		rs = pst.executeQuery();
		while (rs.next()) {
			Loginbean obj = new Loginbean();
			obj.setDate(rs.getString("o_date"));
			obj.setOname(rs.getString("o_name"));
			lst.add(obj);
		}
		return lst;
	}

	// -------------------------------------END
	// VALIDATION--------------------------

	// --------------------------------------START EMPLOYEE
	// Insertion------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: employee insertion
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * 
	 * @return : boolean
	 */

	public static boolean addemployee(Loginbean loginbean) throws SQLException {
		try {

			con = getDbConnection();
			pst = con.prepareStatement("insert into tbl_user(u_name,u_password,u_location,u_role) values(?,?,?,?)");
			pst.setString(1, loginbean.getUsername());
			pst.setString(2, loginbean.getPassword());
			pst.setString(3, loginbean.getLocation());
			pst.setString(4, loginbean.getRole());

			pst.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// -------------------------------------END Insertion
	// employee--------------------------
	// --------------------------------------START fecth employee
	// data------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: employee view
	 * @param :
	 *            nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * 
	 * @return :arrayLisst
	 */

	public static ArrayList<Loginbean> viewEmployeeList() throws SQLException {

		// ArrayList<notifications> eb = new ArrayList<notifications>();
		ArrayList<Loginbean> lb = new ArrayList<Loginbean>();

		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tbl_user where u_role='employee'");

			rs = pst.executeQuery();
			while (rs.next()) {
				Loginbean loginBean = new Loginbean();
				loginBean.setUid(rs.getInt(1));
				loginBean.setUsername(rs.getString(2));
				loginBean.setPassword(rs.getString(3));
				loginBean.setLocation(rs.getString(5));
				loginBean.setRole(rs.getString(4));
				lb.add(loginBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lb;

	}

	// -------------------------------------END
	// viewing--------------------------
	public static ArrayList<Loginbean> view(String uname) throws SQLException {

		ArrayList<Loginbean> eb = new ArrayList<Loginbean>();
		try {

			Loginbean lt = new Loginbean();
			con = getDbConnection();
			pst = con.prepareStatement("select * from tbl_customer where c_name=?");
			pst.setString(1,uname);
			rs = pst.executeQuery();
			while (rs.next()) {
				Loginbean eq = new Loginbean();
				eq.setCustomerName(rs.getString(2));
				eq.setUsername(rs.getString(3));
				eq.setPassword(rs.getString(4));
				eq.setAddress(rs.getString(7));

				eb.add(eq);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}

}
