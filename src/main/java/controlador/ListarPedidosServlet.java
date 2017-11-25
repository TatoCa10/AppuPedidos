package controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.PedidosDAO;
import dao.TiendaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import vo.PedidosVO;
import vo.TiendaVO;

/**
 *
 * @author Carlos Alberto
 */
@WebServlet(urlPatterns = {"/ListarPedidosServlet"})
public class ListarPedidosServlet extends HttpServlet {
    
    private ArrayList<PedidosVO> pedidos;
    private PedidosDAO p;
    private JSONObject json;
    private JSONArray array;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListarPedidosServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListarPedidosServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            HttpSession sesion = request.getSession();
            String correo = (String) sesion.getAttribute("correo");
        
        
            this.p=new PedidosDAO();
            
            this.pedidos = p.listarPedidos(correo);
            
            array = new JSONArray();
            
            
            
            for (PedidosVO pedido : pedidos) {
                
            json = new JSONObject();
            

            json.put("id",pedido.getID());
            json.put("vendedor", pedido.getVendedor());
            json.put("comprador",pedido.getComprador());
            json.put("productos",pedido.getProductos());
            json.put("comentario",pedido.getComentario());
            json.put("checker",String.valueOf(pedido.getChecker()));
            array.put(json);
            }
            JSONObject mainJson = new JSONObject();
            mainJson.put("pedidos",array);
            
            
            out.print(mainJson);
        
        
        
        
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
