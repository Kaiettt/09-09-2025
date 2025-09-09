<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Shopping Cart</title>
            <style>
                table {
                    width: 80%;
                    border-collapse: collapse;
                    margin: 20px auto;
                }

                th,
                td {
                    padding: 10px 15px;
                    border: 1px solid #ddd;
                    text-align: center;
                }

                th {
                    background-color: #4CAF50;
                    color: white;
                }

                input[type=number] {
                    width: 60px;
                }

                button {
                    padding: 5px 10px;
                    margin-left: 5px;
                }
            </style>
        </head>

        <body>

            <h1 style="text-align:center;">Your Cart</h1>
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
                                    <!-- Quantity with update -->
                                    <td>
                                        <input type="number" name="quantity_${item.product.id}" value="${item.quantity}"
                                            min="1">
                                        <button type="submit" name="action"
                                            value="update_${item.product.id}">Update</button>
                                    </td>
                                    <td>${item.product.name}</td>
                                    <td>$ ${item.product.price}</td>
                                    <td>$ ${item.totalPrice}</td> <!-- Corrected amount -->
                                    <td>
                                        <button type="submit" name="action"
                                            value="remove_${item.product.id}">Remove</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                </form>
            </c:if>

        </body>

        </html>