package project.meal;

public class MealTimeBean {
	private String schoolDate;
	private String schoolTime;
	
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
	
	@Override
	public String toString() {
		return "MealTimeBean [schoolDate=" + schoolDate + ", schoolTime=" + schoolTime + "]";
	}
}