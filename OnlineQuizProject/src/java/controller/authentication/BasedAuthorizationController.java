/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.ControllerDBContext;
import entity.Account;
import entity.RoleAccess;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author hatua
 */
public abstract class BasedAuthorizationController extends BasedRequiredAuthenticationController {

    private boolean isAuthorized(Account LoggedUser, HttpServletRequest request) {
        String username = LoggedUser.getDisplayName();
        String url = request.getServletPath();
        ControllerDBContext db = new ControllerDBContext();
        LoggedUser.setRoles(db.getRolesAndFeatures(username, url));
        return 1 <= LoggedUser.getRoles().size();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        if (isAuthorized(LoggedUser, request)) {
            doGet(request, response, LoggedUser, LoggedUser.getRoles());
        } else {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error 403 - Forbidden</title>");
                out.println("<style>");
                out.println(" html {\n"
                        + "                background-color: #000121;\n"
                        + "                font-family: 'Roboto', sans-serif;\n"
                        + "\n"
                        + "            }\n"
                        + "\n"
                        + "            .maincontainer {\n"
                        + "                position: relative;\n"
                        + "                top: -50px;\n"
                        + "                transform: scale(0.8);\n"
                        + "                background: url(\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/HauntedHouseBackground.png\");\n"
                        + "                background-repeat: no-repeat;\n"
                        + "                background-position: center;\n"
                        + "                background-size: 700px 600px;\n"
                        + "                width: 800px;\n"
                        + "                height: 600px;\n"
                        + "                margin: 0px auto;\n"
                        + "                display: grid;\n"
                        + "            }\n"
                        + "\n"
                        + "            .foregroundimg {\n"
                        + "                position: relative;\n"
                        + "                width: 100%;\n"
                        + "                top: -230px;\n"
                        + "                z-index: 5;\n"
                        + "            }\n"
                        + "\n"
                        + "            .errorcode {\n"
                        + "                position: relative;\n"
                        + "                top: -200px;\n"
                        + "                font-family: 'Creepster', cursive;\n"
                        + "                color: white;\n"
                        + "                text-align: center;\n"
                        + "                font-size: 6em;\n"
                        + "                letter-spacing: 0.1em;\n"
                        + "            }\n"
                        + "\n"
                        + "            .errortext {\n"
                        + "                position: relative;\n"
                        + "                top: -260px;\n"
                        + "                color: #FBD130;\n"
                        + "                text-align: center;\n"
                        + "                text-transform: uppercase;\n"
                        + "                font-size: 1.8em;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat {\n"
                        + "                opacity: 0;\n"
                        + "                position: relative;\n"
                        + "                transform-origin: center;\n"
                        + "                z-index: 3;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat:nth-child(1) {\n"
                        + "                top: 380px;\n"
                        + "                left: 120px;\n"
                        + "                transform: scale(0.5);\n"
                        + "                animation: 13s 1s flyBat1 infinite linear;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat:nth-child(2) {\n"
                        + "                top: 280px;\n"
                        + "                left: 80px;\n"
                        + "                transform: scale(0.3);\n"
                        + "                animation: 8s 4s flyBat2 infinite linear;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat:nth-child(3) {\n"
                        + "                top: 200px;\n"
                        + "                left: 150px;\n"
                        + "                transform: scale(0.4);\n"
                        + "                animation: 12s 2s flyBat3 infinite linear;\n"
                        + "            }\n"
                        + "\n"
                        + "            .body {\n"
                        + "                position: relative;\n"
                        + "                width: 50px;\n"
                        + "                top: 12px;\n"
                        + "            }\n"
                        + "\n"
                        + "            .wing {\n"
                        + "                width: 150px;\n"
                        + "                position: relative;\n"
                        + "                transform-origin: right center;\n"
                        + "            }\n"
                        + "\n"
                        + "            .leftwing {\n"
                        + "                left: 30px;\n"
                        + "                animation: 0.8s flapLeft infinite ease-in-out;\n"
                        + "            }\n"
                        + "\n"
                        + "            .rightwing {\n"
                        + "                left: -180px;\n"
                        + "                transform: scaleX(-1);\n"
                        + "                animation: 0.8s flapRight infinite ease-in-out;\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flapLeft {\n"
                        + "                0% {\n"
                        + "                    transform: rotateZ(0);\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    transform: rotateZ(10deg) rotateY(40deg);\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    transform: rotateZ(0);\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flapRight {\n"
                        + "                0% {\n"
                        + "                    transform: scaleX(-1) rotateZ(0);\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    transform: scaleX(-1) rotateZ(10deg) rotateY(40deg);\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    transform: scaleX(-1) rotateZ(0);\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flyBat1 {\n"
                        + "                0% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5)\n"
                        + "                }\n"
                        + "                25% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(-400px, -330px)\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(400px, -800px)\n"
                        + "                }\n"
                        + "                75% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(600px, 100px)\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(100px, 300px)\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flyBat2 {\n"
                        + "                0% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3)\n"
                        + "                }\n"
                        + "                25% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(200px, -330px)\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(-300px, -800px)\n"
                        + "                }\n"
                        + "                75% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(-400px, 100px)\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(100px, 300px)\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flyBat3 {\n"
                        + "                0% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4)\n"
                        + "                }\n"
                        + "                25% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(-350px, -330px)\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(400px, -800px)\n"
                        + "                }\n"
                        + "                75% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(-600px, 100px)\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(100px, 300px)\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @media only screen and (max-width: 850px) {\n"
                        + "                .maincontainer {\n"
                        + "                    transform: scale(0.6);\n"
                        + "                    width: 600px;\n"
                        + "                    height: 400px;\n"
                        + "                    background-size: 600px 400px;\n"
                        + "                }\n"
                        + "\n"
                        + "                .errortext {\n"
                        + "                    font-size: 1em;\n"
                        + "                }\n"
                        + "            }");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class=\"maincontainer\">");
                out.println("<div class=\"bat\">");
                out.println("<img class=\"wing leftwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("<img class=\"body\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-body.png\" alt=\"bat\">");
                out.println("<img class=\"wing rightwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("</div>");
                out.println("<div class=\"bat\">");
                out.println("<img class=\"wing leftwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("<img class=\"body\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-body.png\" alt=\"bat\">");
                out.println("<img class=\"wing rightwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("</div>");
                out.println("<div class=\"bat\">");
                out.println("<img class=\"wing leftwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("<img class=\"body\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-body.png\" alt=\"bat\">");
                out.println("<img class=\"wing rightwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("</div>");
                out.println("<img class=\"foregroundimg\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/HauntedHouseForeground.png\" alt=\"haunted house\">");
                out.println("</div>");
                out.println("<h1 class=\"errorcode\">ACCESS DENIED</h1>");
                out.println("<div class=\"errortext\">This area is forbidden. Turn back after 3 seconds!</div>");
                out.println("<script>");
                out.println("// Redirect back to the previous page after 3 seconds");
                out.println("setTimeout(function () {");
                out.println("window.history.back();");
                out.println("}, 3000);");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        if (isAuthorized(LoggedUser, request)) {
            doPost(request, response, LoggedUser, LoggedUser.getRoles());
        } else {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error 403 - Forbidden</title>");
                out.println("<style>");
                out.println(" html {\n"
                        + "                background-color: #000121;\n"
                        + "                font-family: 'Roboto', sans-serif;\n"
                        + "\n"
                        + "            }\n"
                        + "\n"
                        + "            .maincontainer {\n"
                        + "                position: relative;\n"
                        + "                top: -50px;\n"
                        + "                transform: scale(0.8);\n"
                        + "                background: url(\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/HauntedHouseBackground.png\");\n"
                        + "                background-repeat: no-repeat;\n"
                        + "                background-position: center;\n"
                        + "                background-size: 700px 600px;\n"
                        + "                width: 800px;\n"
                        + "                height: 600px;\n"
                        + "                margin: 0px auto;\n"
                        + "                display: grid;\n"
                        + "            }\n"
                        + "\n"
                        + "            .foregroundimg {\n"
                        + "                position: relative;\n"
                        + "                width: 100%;\n"
                        + "                top: -230px;\n"
                        + "                z-index: 5;\n"
                        + "            }\n"
                        + "\n"
                        + "            .errorcode {\n"
                        + "                position: relative;\n"
                        + "                top: -200px;\n"
                        + "                font-family: 'Creepster', cursive;\n"
                        + "                color: white;\n"
                        + "                text-align: center;\n"
                        + "                font-size: 6em;\n"
                        + "                letter-spacing: 0.1em;\n"
                        + "            }\n"
                        + "\n"
                        + "            .errortext {\n"
                        + "                position: relative;\n"
                        + "                top: -260px;\n"
                        + "                color: #FBD130;\n"
                        + "                text-align: center;\n"
                        + "                text-transform: uppercase;\n"
                        + "                font-size: 1.8em;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat {\n"
                        + "                opacity: 0;\n"
                        + "                position: relative;\n"
                        + "                transform-origin: center;\n"
                        + "                z-index: 3;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat:nth-child(1) {\n"
                        + "                top: 380px;\n"
                        + "                left: 120px;\n"
                        + "                transform: scale(0.5);\n"
                        + "                animation: 13s 1s flyBat1 infinite linear;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat:nth-child(2) {\n"
                        + "                top: 280px;\n"
                        + "                left: 80px;\n"
                        + "                transform: scale(0.3);\n"
                        + "                animation: 8s 4s flyBat2 infinite linear;\n"
                        + "            }\n"
                        + "\n"
                        + "            .bat:nth-child(3) {\n"
                        + "                top: 200px;\n"
                        + "                left: 150px;\n"
                        + "                transform: scale(0.4);\n"
                        + "                animation: 12s 2s flyBat3 infinite linear;\n"
                        + "            }\n"
                        + "\n"
                        + "            .body {\n"
                        + "                position: relative;\n"
                        + "                width: 50px;\n"
                        + "                top: 12px;\n"
                        + "            }\n"
                        + "\n"
                        + "            .wing {\n"
                        + "                width: 150px;\n"
                        + "                position: relative;\n"
                        + "                transform-origin: right center;\n"
                        + "            }\n"
                        + "\n"
                        + "            .leftwing {\n"
                        + "                left: 30px;\n"
                        + "                animation: 0.8s flapLeft infinite ease-in-out;\n"
                        + "            }\n"
                        + "\n"
                        + "            .rightwing {\n"
                        + "                left: -180px;\n"
                        + "                transform: scaleX(-1);\n"
                        + "                animation: 0.8s flapRight infinite ease-in-out;\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flapLeft {\n"
                        + "                0% {\n"
                        + "                    transform: rotateZ(0);\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    transform: rotateZ(10deg) rotateY(40deg);\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    transform: rotateZ(0);\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flapRight {\n"
                        + "                0% {\n"
                        + "                    transform: scaleX(-1) rotateZ(0);\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    transform: scaleX(-1) rotateZ(10deg) rotateY(40deg);\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    transform: scaleX(-1) rotateZ(0);\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flyBat1 {\n"
                        + "                0% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5)\n"
                        + "                }\n"
                        + "                25% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(-400px, -330px)\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(400px, -800px)\n"
                        + "                }\n"
                        + "                75% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(600px, 100px)\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.5) translate(100px, 300px)\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flyBat2 {\n"
                        + "                0% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3)\n"
                        + "                }\n"
                        + "                25% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(200px, -330px)\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(-300px, -800px)\n"
                        + "                }\n"
                        + "                75% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(-400px, 100px)\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.3) translate(100px, 300px)\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @keyframes flyBat3 {\n"
                        + "                0% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4)\n"
                        + "                }\n"
                        + "                25% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(-350px, -330px)\n"
                        + "                }\n"
                        + "                50% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(400px, -800px)\n"
                        + "                }\n"
                        + "                75% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(-600px, 100px)\n"
                        + "                }\n"
                        + "                100% {\n"
                        + "                    opacity: 1;\n"
                        + "                    transform: scale(0.4) translate(100px, 300px)\n"
                        + "                }\n"
                        + "            }\n"
                        + "\n"
                        + "            @media only screen and (max-width: 850px) {\n"
                        + "                .maincontainer {\n"
                        + "                    transform: scale(0.6);\n"
                        + "                    width: 600px;\n"
                        + "                    height: 400px;\n"
                        + "                    background-size: 600px 400px;\n"
                        + "                }\n"
                        + "\n"
                        + "                .errortext {\n"
                        + "                    font-size: 1em;\n"
                        + "                }\n"
                        + "            }");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class=\"maincontainer\">");
                out.println("<div class=\"bat\">");
                out.println("<img class=\"wing leftwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("<img class=\"body\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-body.png\" alt=\"bat\">");
                out.println("<img class=\"wing rightwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("</div>");
                out.println("<div class=\"bat\">");
                out.println("<img class=\"wing leftwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("<img class=\"body\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-body.png\" alt=\"bat\">");
                out.println("<img class=\"wing rightwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("</div>");
                out.println("<div class=\"bat\">");
                out.println("<img class=\"wing leftwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("<img class=\"body\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-body.png\" alt=\"bat\">");
                out.println("<img class=\"wing rightwing\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/bat-wing.png\">");
                out.println("</div>");
                out.println("<img class=\"foregroundimg\" src=\"https://aimieclouse.com/Media/Portfolio/Error403Forbidden/HauntedHouseForeground.png\" alt=\"haunted house\">");
                out.println("</div>");
                out.println("<h1 class=\"errorcode\">ACCESS DENIED</h1>");
                out.println("<div class=\"errortext\">This area is forbidden. Turn back after 3 seconds!</div>");
                out.println("<script>");
                out.println("// Redirect back to the previous page after 3 seconds");
                out.println("setTimeout(function () {");
                out.println("window.history.back();");
                out.println("}, 3000);");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException;

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException;

}
