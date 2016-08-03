package ro.sci.starttobet.domain;

public class Football implements DomainObject{

	private int id;
	
	//home/away teams
	private String homeTeam;
	private String awayTeam;
	
	//odds - 1 x 2 1x x2 12
	private double hWin;
	private double aWin;
	private double draw;
	private double hOrDraw;
	private double aOrDraw;
	private double hOra;
	
	public String getHomeTeam() {
		return homeTeam;
	}

	public void setHomeTeam(String homeTeam) {
		this.homeTeam = homeTeam;
	}

	public String getAwayTeam() {
		return awayTeam;
	}

	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
	}

	public double gethWin() {
		return hWin;
	}

	public void sethWin(double hWin) {
		this.hWin = hWin;
	}

	public double getaWin() {
		return aWin;
	}

	public void setaWin(double aWin) {
		this.aWin = aWin;
	}

	public double getDraw() {
		return draw;
	}

	public void setDraw(double draw) {
		this.draw = draw;
	}

	public double gethOrDraw() {
		return hOrDraw;
	}

	public void sethOrDraw(double hOrDraw) {
		this.hOrDraw = hOrDraw;
	}

	public double getaOrDraw() {
		return aOrDraw;
	}

	public void setaOrDraw(double aOrDraw) {
		this.aOrDraw = aOrDraw;
	}

	public double gethOra() {
		return hOra;
	}

	public void sethOra(double hOra) {
		this.hOra = hOra;
	}

	public void setId(int id) {
		this.id = id;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

}
