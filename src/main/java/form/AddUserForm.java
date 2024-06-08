package form;

import java.time.Instant;
import java.util.HashMap;

import beans.User;
import dao.UserDao;
import javax.servlet.http.HttpServletRequest;

public class AddUserForm {
	private static final String CHAMP_NOM = "nom";
	private static final String CHAMP_PRENOM = "prenom";
	private static final String CHAMP_LOGIN = "login";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_ADRESSE = "adresse";
	private static final String CHAMP_DATE_DE_NAISSANCE = "datedenaissance";
	private static final String CHAMP_PASSWORD = "password";
	private static final String CHAMP_PASSWORD_BIS = "password";
	
	private static final String MSG_ERROR_PASSWORD = "Les mots de passe ne sont pas conformes"; 
	private static final String MSG_EMPTY_FIELD = "Vous devez renseigner ce champ"; 
	private static final String MSG_ERROR_NOT_SAME_PASSWORD = "Les mots de passe ne sont pas identiques"; 
	
	private User user;
	private HashMap<String, String> erreurs;
	private HttpServletRequest request;
	private String statusMessage;
	private boolean status;
	
	public AddUserForm(HttpServletRequest request) {
		this.status = false;
		this.request = request;
		this.erreurs = new HashMap<String, String>();
	}
	
	public boolean ajouter() {
		
		String nom = this.getParameter(CHAMP_NOM);
		String prenom = this.getParameter(CHAMP_PRENOM);
		String login = this.getParameter(CHAMP_LOGIN);
		String password = this.getParameter(CHAMP_PASSWORD);
		// complete
		String email = this.getParameter(CHAMP_EMAIL);
		String adresse = this.getParameter(CHAMP_ADRESSE);
		String dateString = request.getParameter(CHAMP_DATE_DE_NAISSANCE) + "T00:00:00Z";
		
		Instant datedenaissance = Instant.parse(dateString);

		this.user = new User(nom, prenom, login, email, adresse, datedenaissance, password);	  // complete
		this.validerChamps(CHAMP_NOM, CHAMP_PRENOM, CHAMP_LOGIN, CHAMP_PASSWORD, CHAMP_PASSWORD_BIS);	// A completer
		this.validerPassword();

		if (this.erreurs.isEmpty()) {
			
			this.status = UserDao.ajouter(user);

			if (this.status) {
				this.statusMessage = "Ajout effectué avec succès";
			} else {
				this.statusMessage = "Echec de l'ajout";
			}
		}	
		
		return this.status;
	}
	
	private void validerPassword() {
		String password = this.getParameter(CHAMP_PASSWORD);
		String passwordBis = this.getParameter(CHAMP_PASSWORD_BIS);
		
		if(password != null && !password.equals(passwordBis)) {
			this.erreurs.put(CHAMP_PASSWORD, MSG_ERROR_NOT_SAME_PASSWORD);
			this.erreurs.put(CHAMP_PASSWORD_BIS, MSG_ERROR_NOT_SAME_PASSWORD);
		}
	}
	
	private void validerChamps(String... champs) {
		for(String champ:champs) {
			if(this.getParameter(champ) == null) {
				this.erreurs.put(champ, MSG_EMPTY_FIELD);
			}
		}
	}
	
	private String getParameter(String parameter) {
		String valeur = request.getParameter(parameter);
		
		if(valeur != null && !valeur.isBlank()) {
			return valeur.trim();
		}
		
		return null;
	}

	public User getUser() {
		return user;
	}

	public HashMap<String, String> getErreurs() {
		return erreurs;
	}

	public String getStatusMessage() {
		return statusMessage;
	}

	public boolean getStatus() {
		return status;
	}
	
	
}
