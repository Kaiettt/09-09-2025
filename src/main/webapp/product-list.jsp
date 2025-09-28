<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Product List</title>
            <style>
                body {
                    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                    margin: 0;
                    padding: 0;
                    background: #f4f7fb;
                }

                h1 {
                    text-align: center;
                    margin: 25px 0;
                    color: #333;
                }

                .container {
                    width: 85%;
                    margin: auto;
                }

                .success-msg {
                    background: #d4edda;
                    color: #155724;
                    padding: 12px 18px;
                    border-radius: 6px;
                    margin: 15px auto;
                    width: fit-content;
                    font-weight: bold;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                }

                table {
                    width: 100%;
                    margin-top: 20px;
                    border-collapse: collapse;
                    background: #fff;
                    border-radius: 12px;
                    overflow: hidden;
                    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
                }

                th {
                    background: linear-gradient(135deg, #007BFF, #0056b3);
                    color: #fff;
                    padding: 14px;
                    text-align: center;
                    font-size: 16px;
                }

                td {
                    padding: 14px;
                    text-align: center;
                    font-size: 15px;
                    border-bottom: 1px solid #f0f0f0;
                    color: #444;
                }

                tr:hover {
                    background: #f9f9f9;
                }

                button {
                    background: #28a745;
                    color: white;
                    border: none;
                    padding: 8px 14px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 14px;
                    transition: all 0.3s ease;
                }

                button:hover {
                    background: #218838;
                }

                .cart-link {
                    text-align: center;
                    margin: 30px 0;
                }

                .cart-link a {
                    text-decoration: none;
                    background: #007BFF;
                    color: white;
                    font-weight: bold;
                    padding: 12px 22px;
                    border-radius: 8px;
                    transition: all 0.3s ease;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                }

                .cart-link a:hover {
                    background: #0056b3;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1>Product List</h1>

                <!-- Thông báo thêm sản phẩm thành công -->
                <c:if test="${not empty successMessage}">
                    <div class="success-msg">${successMessage}</div>
                </c:if>

                <table>
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td>${product.name}</td>
                                <td>$${product.price}</td>
                                <td>
                                    <form action="cart" method="post">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <input type="hidden" name="productName" value="${product.name}">
                                        <input type="hidden" name="productPrice" value="${product.price}">
                                        <button type="submit">Add to Cart</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="cart-link">
                    <a href="<%= request.getContextPath() %>/cart">🛒 View Cart</a>
                </div>
            </div>
        </body>

        </html>