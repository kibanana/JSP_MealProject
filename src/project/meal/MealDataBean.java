package project.meal;

public class MealDataBean {
	private int idx;
	private String schoolDate;
	private String schoolTime;
	private String Menu;
	private double cal;
	private double pro;
	private double ca;
	private double fe;
	private int reco;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSchoolDate() {
		return schoolDate;
	}
	public void setSchoolDate(String schoolDate) {
		this.schoolDate = schoolDate;
	}
	public String getSchoolTime() {
		return schoolTime;
	}
	public void setSchoolTime(String schoolTime) {
		this.schoolTime = schoolTime;
	}
	public String getMenu() {
		return Menu;
	}
	public void setMenu(String menu) {
		Menu = menu;
	}
	public double getCal() {
		return cal;
	}
	public void setCal(double cal) {
		this.cal = cal;
	}
	public double getPro() {
		return pro;
	}
	public void setPro(double pro) {
		this.pro = pro;
	}
	public double getCa() {
		return ca;
	}
	public void setCa(double ca) {
		this.ca = ca;
	}
	public double getFe() {
		return fe;
	}
	public void setFe(double fe) {
		this.fe = fe;
	}
	public int getReco() {
		return reco;
	}
	public void setReco(int reco) {
		this.reco = reco;
	}
	
	@Override
	public String toString() {
		return "MealDataBean [idx=" + idx + ", schoolDate=" + schoolDate + ", schoolTime=" + schoolTime + ", Menu="
				+ Menu + ", cal=" + cal + ", pro=" + pro + ", ca=" + ca + ", fe=" + fe + ", reco=" + reco + "]";
	}
}