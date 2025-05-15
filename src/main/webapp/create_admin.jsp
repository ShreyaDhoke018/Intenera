<%@ page session="true" %>
<%
    String message = (String) session.getAttribute("message1");
    if (message != null) {
%>
<div style="background-color: #d1e7dd; color: #0f5132; padding: 15px; border: 2px solid #badbcc; border-radius: 8px; margin: 20px auto; max-width: 600px; text-align: center; font-weight: bold;">
    <%= message %>
</div>
<%
        session.removeAttribute("message1");
    }
%>

<!-- Background styling to center the form -->
<div style="display: flex; align-items: center; justify-content: center; height: 100vh; background: linear-gradient(135deg, #f5f7fa, #c3cfe2); font-family: 'Segoe UI', sans-serif;">

    <!-- Card/Form Container -->
    <div style="width: 500px; background: white; padding: 40px; border-radius: 20px; box-shadow: 0 8px 20px rgba(0,0,0,0.15);">
        <h2 style="text-align: center; color: #333; margin-bottom: 30px;">Create New Admin</h2>

        <form action="CreateUserServlet" method="post">
            <div style="margin-bottom: 20px;">
                <label style="font-weight: 600; color: #333;">Full Name</label>
                <input type="text" name="fullname" required style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; margin-top: 5px;">
            </div>

            <div style="margin-bottom: 20px;">
                <label style="font-weight: 600; color: #333;">Email</label>
                <input type="email" name="email" required style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; margin-top: 5px;">
            </div>

            <div style="margin-bottom: 30px;">
                <label style="font-weight: 600; color: #333;">Password</label>
                <input type="password" name="password" required style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; margin-top: 5px;">
            </div>

            <input type="hidden" name="role" value="admin">

            <button type="submit" style="width: 100%; background-color: #28a745; color: white; padding: 14px; border: none; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer;">
                Create Admin
            </button>
        </form>
    </div>
</div>
