package Model;
// default package
// Generated 23 nov 2023 17:45:51 by Hibernate Tools 5.2.13.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * Categories generated by hbm2java
 */
@Entity
@Table(name = "Categories", catalog = "Library")
public class Categories implements java.io.Serializable {

	private int categoryId;
	private String name;
	private Set<Books> bookses = new HashSet<Books>(0);

	public Categories() {
	}

	public Categories(int categoryId) {
		this.categoryId = categoryId;
	}

	public Categories(int categoryId, String name, Set<Books> bookses) {
		this.categoryId = categoryId;
		this.name = name;
		this.bookses = bookses;
	}

	@Id

	@Column(name = "CategoryID", unique = true, nullable = false)
	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "Name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "categorieses")
	public Set<Books> getBookses() {
		return this.bookses;
	}

	public void setBookses(Set<Books> bookses) {
		this.bookses = bookses;
	}

}
