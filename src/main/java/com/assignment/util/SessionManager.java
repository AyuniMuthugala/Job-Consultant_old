package com.assignment.util;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import com.assignment.entities.Employee;

public class SessionManager {

    private static SessionManager instance = null;

    private SessionManager() {
    }

    public static SessionManager getInstance() {
        if (instance == null) {
            synchronized (SessionManager.class) {
                if (instance == null) {
                    instance = new SessionManager();
                }
            }
        }
        return instance;
    }

    public static final String EMPLOYEE_ID = "employee_id";
    public static final String FULL_NAME = "full_name";
    public static final String USER_TYPE = "user_type";
    public static final String EMAIL = "email";
    public static final String CONTACT_NO = "contact_no";
    public static final String PASSWORD = "password";
    public static final String SHOW_ADMIN = "showadmin";
    public static final String SHOW_CON = "showcon";

    public void setEmployeeSessionAttributes(HttpSession session, Employee employee) {
        session.setAttribute(EMPLOYEE_ID, employee.getEmployee_id());
        session.setAttribute(FULL_NAME, employee.getFullName());
        session.setAttribute(USER_TYPE, employee.getUserType());
        session.setAttribute(EMAIL, employee.getEmail());
        session.setAttribute(CONTACT_NO, employee.getContactNo());
        session.setAttribute(PASSWORD, employee.getPassword());

        if ("admin".equals(employee.getUserType())) {
            session.setAttribute(SHOW_ADMIN, "show");
            session.setAttribute(SHOW_CON, "d-none");
        } else if ("normal".equals(employee.getUserType())) {
            session.setAttribute(SHOW_ADMIN, "d-none");
            session.setAttribute(SHOW_CON, "show");
        }
    }

    // You can add more session-related methods as needed
}