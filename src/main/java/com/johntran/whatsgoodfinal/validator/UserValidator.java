package com.johntran.whatsgoodfinal.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.repositories.UserRepository;

@Component
public class UserValidator implements Validator{
	
	@Autowired
    private UserRepository userRepository;
	
	
	@Override
    public boolean supports(Class<?> c) {
        return User.class.equals(c);
    }
    
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        // check if email already registered
        User emailCheckUser = userRepository.findByEmail(user.getEmail());
        if(emailCheckUser != null) {
        	errors.rejectValue("email", "Duplicate.user.email");
        }
        
        // check if username taken
        User usernameCheckUser = userRepository.findByUserNameIgnoreCase(user.getUserName());
        if (usernameCheckUser != null) {
            errors.rejectValue("userName", "Duplicate.user.userName");
        }
        
        // checks if passwords match
        if (!user.getConfirm().equals(user.getPassword())) {
            errors.rejectValue("confirm", "Match");
        }         
    }
}
