package app;

import java.util.List;

import org.hibernate.Session;

import org.hibernate.query.Query;

import Model.Authors;
import Utilities.Utilidades;

public class App {

	public static void main(String[] args) {

		Session laSesion = HibernateUtil.getSessionFactory().getCurrentSession();

		// solicitar la cantidad de autores a mostrar por pagina.
		int autoresxPagina = Utilidades.leerEnteroC("Dime el numero de autores a mostrar por pagina");

		try {
			laSesion.getTransaction().begin();
			// contar cuantos autores hay en total.
			Query<Long> countQuery = laSesion.createQuery("SELECT COUNT(*) FROM Authors", Long.class);
			long totalAutores = countQuery.uniqueResult();

			// dividirlos entre cuantos autores queremos mostrar por pagina, sumamos uno si
			// el resto no es 0
			long totalPaginas = (totalAutores / autoresxPagina) + ((totalAutores % autoresxPagina != 0) ? 1 : 0);

			boolean salir = false;

			int paginaActual = 1;

			while (!salir) {
				int primerResultado = (paginaActual - 1) * autoresxPagina;

				// Selecciono todos los autores, marcamos el primero y hasta donde contar.
				Query<Authors> query = laSesion.createQuery("FROM Authors", Authors.class);
				query.setFirstResult(primerResultado);
				query.setMaxResults(autoresxPagina);
				// se guarda en la lista cada grupo de autores a mostrar
				List<Authors> autores = query.list();

				// se imprime la información de los autores
				System.out.println("Página " + paginaActual + " de " + totalPaginas);
				for (Authors autor : autores) {
					System.out.println( "ID: " + autor.getAuthorId() + ", Nombre: " + autor.getName()+", Nacionalidad: "+ autor.getNationality());
				}

				// Menú para moverse entre páginas
				System.out.println("< S > Página siguiente");
				System.out.println("< A > Página anterior");
				System.out.println("< G n > Go to n, numero de pagina");
				System.out.println("< Q >. Salir");
				System.out.print(" ");

				String opcionMenu = Utilidades.leerTextoC("dime la opcion elegida");

				switch (opcionMenu) {
					case "S":
						if (paginaActual < totalPaginas) {
							paginaActual++;
						} else {
							System.out.println("Ya estás en la última página.");
						}
						break;
					case "A":
						if (paginaActual > 1) {
							paginaActual--;
						} else {
							System.out.println("Ya estás en la primera página.");
						}
						break;
					case "G n":
						int pagGoto = Utilidades.leerEnteroC("Hay "+totalPaginas + " a que pagina quieres acceder?" );
						if (pagGoto >= 1 && pagGoto <= totalPaginas) {
					        paginaActual = pagGoto;
					    } else {
					        System.out.println("Número de página inválido. Debe estar entre 1 y " + totalPaginas);
					    }
						break;
						
						
					case "Q":
						salir = true;
						break;
					default:
						System.out.println("Opción no válida. Intente de nuevo.");
						break;
					}
			}

			laSesion.getTransaction().commit();

			laSesion.close();
		} catch (Exception e) {
			e.printStackTrace();
		
		}

		
	}

}
