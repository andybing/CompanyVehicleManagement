package model;

public class Record {
	private int id;
	private int application_id;
	private int user_id;
	private String car_id;
	private int driver_id;
	private String beginday;
	private String endday;
	private String isreturn;
	private String returnday;
	private String cost;
	private String notes;
	public int getApplication_id() {
		return application_id;
	}
	public void setApplication_id(int application_id) {
		this.application_id = application_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public int getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}
	public String getBeginday() {
		return beginday;
	}
	public void setBeginday(String beginday) {
		this.beginday = beginday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getIsreturn() {
		return isreturn;
	}
	public void setIsreturn(String isreturn) {
		this.isreturn = isreturn;
	}
	public String getReturnday() {
		return returnday;
	}
	public void setReturnday(String returnday) {
		this.returnday = returnday;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Record() {
		super();
	}
	
public Record(Application application){
	this.application_id=application.getId();
	this.car_id=application.getCar_id();
	this.driver_id=application.getDriver_id();
	this.user_id=application.getUser_id();
	this.beginday=application.getBeginday();
	this.endday=application.getEndday();
	
}
}
