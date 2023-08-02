package com.johntran.whatsgoodfinal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Role;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.repositories.RoleRepository;
import com.johntran.whatsgoodfinal.repositories.UserRepository;

@Service
public class UserService {
	private UserRepository userRepository;
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    
    
    // 1
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        userRepository.save(user);
    }
     
     // 2 
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }    
    
    // FIND USER BY EMAIL
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    // FIND USER BY ID
    public User findById(Long userId) {
    	Optional<User> oneUser = userRepository.findById(userId);
    	if(oneUser.isPresent()){
    		return oneUser.get();
    	}
    	return null;
    }
    
    // CHANGE USER ROLE
    public void changeRole(User user) {
    	System.out.println("USER SERVICE");
    	
    	List<Role> currentRoles = user.getRoles();
    	
    	if (currentRoles.get(0).getName().equals("ROLE_ADMIN")) {
            user.setRoles(roleRepository.findByName("ROLE_USER"));
            System.out.println("set to user");
        } else {
            user.setRoles(roleRepository.findByName("ROLE_Admin"));
            System.out.println("set to admin");
        }
    	
    	userRepository.save(user);
    	
    	System.out.println("updated user");
    }
    
    public List<User> allUsers(){
    	return userRepository.findAll();
    }
    
    public void updateUser(User user) {
    	userRepository.save(user);
    }
    
}