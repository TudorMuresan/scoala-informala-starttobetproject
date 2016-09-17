package ro.sci.starttobet.domain;

import java.time.LocalDate;

public class Football extends AbstractModel{


	private int id;//TODO delete
	
	
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
	
	private LocalDate matchDate;
	private String matchTitle;
	
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

	@Override
	public String toString() {
		return "Football [id=" + id + ", homeTeam=" + homeTeam + ", awayTeam=" + awayTeam + ", hWin=" + hWin + ", aWin=" + aWin + ", draw=" + draw + ", hOrDraw=" + hOrDraw
				+ ", aOrDraw=" + aOrDraw + ", hOra=" + hOra + "]";
	}

	public String getMatchTitle() {
		return matchTitle;
	}

	public void setMatchTitle(String matchTitle) {
		this.matchTitle = matchTitle;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(aOrDraw);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(aWin);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((awayTeam == null) ? 0 : awayTeam.hashCode());
		temp = Double.doubleToLongBits(draw);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hOrDraw);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hOra);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hWin);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((homeTeam == null) ? 0 : homeTeam.hashCode());
		result = prime * result + id;
		result = prime * result + ((matchDate == null) ? 0 : matchDate.hashCode());
		result = prime * result + ((matchTitle == null) ? 0 : matchTitle.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Football other = (Football) obj;
		if (Double.doubleToLongBits(aOrDraw) != Double.doubleToLongBits(other.aOrDraw))
			return false;
		if (Double.doubleToLongBits(aWin) != Double.doubleToLongBits(other.aWin))
			return false;
		if (awayTeam == null) {
			if (other.awayTeam != null)
				return false;
		} else if (!awayTeam.equals(other.awayTeam))
			return false;
		if (Double.doubleToLongBits(draw) != Double.doubleToLongBits(other.draw))
			return false;
		if (Double.doubleToLongBits(hOrDraw) != Double.doubleToLongBits(other.hOrDraw))
			return false;
		if (Double.doubleToLongBits(hOra) != Double.doubleToLongBits(other.hOra))
			return false;
		if (Double.doubleToLongBits(hWin) != Double.doubleToLongBits(other.hWin))
			return false;
		if (homeTeam == null) {
			if (other.homeTeam != null)
				return false;
		} else if (!homeTeam.equals(other.homeTeam))
			return false;
		if (id != other.id)
			return false;
		if (matchDate == null) {
			if (other.matchDate != null)
				return false;
		} else if (!matchDate.equals(other.matchDate))
			return false;
		if (matchTitle == null) {
			if (other.matchTitle != null)
				return false;
		} else if (!matchTitle.equals(other.matchTitle))
			return false;
		return true;
	}

	public LocalDate getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(LocalDate matchDate) {
		this.matchDate = matchDate;
	}
}
