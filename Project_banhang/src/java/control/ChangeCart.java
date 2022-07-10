/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dattrinh
 */
@WebServlet(name = "ChangeCart", urlPatterns = {"/changeCart"})
public class ChangeCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] ids = request.getParameterValues("id");
        String[] quantitys = request.getParameterValues("quantity");
        DAO dao = new DAO();
        HashMap<Integer,Product> cart = (HashMap<Integer,Product>) request.getSession().getAttribute("Cart");
        for (int  i = 0; i<ids.length;i++){
            int id = Integer.parseInt(ids[i]);
            int quantity = Integer.parseInt(quantitys[i]);
            System.out.println(quantity);
            if (quantity <=0) cart.remove(id);
            else {
                Product p = cart.get(id);
                Product pshop = dao.getProductByID(id);
                System.err.println("Pshop -- "+ pshop.getQuantity());
                if (pshop.getQuantity()<quantity) quantity = pshop.getQuantity();
                p.setQuantity(quantity);
            }
        }
        request.getSession().setAttribute("Cart", cart);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
