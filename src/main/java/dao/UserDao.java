package dao;

import java.util.ArrayList;

import beans.User;

public class UserDao {

	private static int lastId = 1;
	private static final ArrayList<User> ListUtilisateur = new ArrayList<User>();

	public static ArrayList<User> lister() {
		return ListUtilisateur;

	}

	public static boolean ajouter(User utilisateur) {
		utilisateur.setId(lastId++);
		ListUtilisateur.add(utilisateur);
		return true;
	}

	public static User get(int id) {
		for (User utilisateur : ListUtilisateur) {
			if (utilisateur.getId() == id) {
				return utilisateur;
			}
		}
		return null;
	}

	public static boolean supprimer(int id) {

		for (User utilisateur : ListUtilisateur) {
			if (utilisateur.getId() == id) {
				ListUtilisateur.remove(utilisateur);
				return true;
			}
		}
		return false;
	}

	public static boolean modifier(User user) {

		for (User utilisateur : ListUtilisateur) {
			if (utilisateur.getId() == user.getId()) {
				utilisateur.setNom(user.getNom());
				utilisateur.setPrenom(user.getPrenom());
				utilisateur.setLogin(user.getLogin());
				utilisateur.setPassword(user.getPassword());
				utilisateur.setAdresse(user.getAdresse());
				utilisateur.setEmail(user.getEmail());
				utilisateur.setDateDeNaissance(user.getDateDeNaissance());

				return true;
			}
		}
		return false;
	}

}