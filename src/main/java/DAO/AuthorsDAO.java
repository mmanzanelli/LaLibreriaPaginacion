package DAO;

import Model.Authors;
import Model.Books;
import java.util.List;
import java.util.Set;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class AuthorsDAO {
	
	private final SessionFactory sessionFactory;

    public AuthorsDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * Inserta un nuevo autor en la base de datos.
     *
     * @param author Paso com parametro un autor para insertar en la bd.
     */
    public void insertAuthor(Authors author) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(author);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.err.println("Error al insertar author: " + e.getMessage());
        }
    }
    /**
     * Lee un autor de la base de datos según su ID.
     *
     * @param authorId El ID del autor a buscar.
     * @return El objeto Authors correspondiente al ID proporcionado o null si
     * no se encuentra.
     */
    public Authors readAuthor(int authorId) {
        try (Session session = sessionFactory.openSession()) {
            Authors author = session.get(Authors.class, authorId);
            if (author == null) {
                System.out.println("El autor con ID " + authorId + " no existe en la base de datos.");

            }
            return author;
        } catch (Exception e) {
            System.err.println("Error al insertar author: " + e.getMessage());
            return null;
        }
    }

}
