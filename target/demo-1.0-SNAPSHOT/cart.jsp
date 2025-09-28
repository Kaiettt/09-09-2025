<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Shopping Cart</title>
            <style>
                body {
                    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                    background: #f4f7fb;
                    margin: 0;
                    padding: 0;
                }

                h1 {
                    text-align: center;
                    margin: 20px 0;
                    color: #333;
                }

                table {
                    width: 80%;
                    margin: 20px auto;
                    border-collapse: collapse;
                    background: #fff;
                    border-radius: 12px;
                    overflow: hidden;
                    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
                }

                th {
                    background: linear-gradient(135deg, #4CAF50, #43a047);
                    color: white;
                    font-size: 16px;
                    padding: 12px;
                }

                td {
                    padding: 15px;
                    border-bottom: 1px solid #f0f0f0;
                    font-size: 15px;
                    color: #555;
                }

                tr:hover {
                    background-color: #f9f9f9;
                }

                input[type=number] {
                    width: 70px;
                    padding: 6px;
                    border: 1px solid #ccc;
                    border-radius: 6px;
                    text-align: center;
                }

                button {
                    background: #007bff;
                    color: white;
                    border: none;
                    padding: 8px 14px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 14px;
                    transition: all 0.3s ease;
                }

                button:hover {
                    background: #0056b3;
                }

                .remove-btn {
                    background: #dc3545;
                }

                .remove-btn:hover {
                    background: #a71d2a;
                }

                .continue-link {
                    text-align: center;
                    margin: 30px 0;
                }

                .continue-link a {
                    text-decoration: none;
                    background: #28a745;
                    color: white;
                    font-weight: bold;
                    padding: 12px 20px;
                    border-radius: 8px;
                    transition: all 0.3s ease;
                }

                .continue-link a:hover {
                    background: #1e7e34;
                }
            </style>
        </head>

        <body>

            <h1>Your Cart</h1>
            <c:if test="${not empty cart.items}">
                <form action="cart" method="post">
                    <table>
                        <thead>
                            <tr>
                                <th>Quantity</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Amount</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cart.items}">
                                <tr>
                                    <td>
                                        <input type="number" name="quantity_${item.product.id}" value="${item.quantity}"
                                            min="1">
                                        <button type="submit" name="action"
                                            value="update_${item.product.id}">Update</button>
                                    </td>
                                    <td>${item.product.name}</td>
                                    <td>$ ${item.product.price}</td>
                                    <td>$ ${item.totalPrice}</td>
                                    <td>
                                        <button type="submit" class="remove-btn" name="action"
                                            value="remove_${item.product.id}">Remove</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </c:if>

            <div class="continue-link">
                <a href="<%= request.getContextPath() %>/product">Continue Shopping</a>
            </div>

        </body>

        </html>