package dao;

import bean.Favorite;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FavoriteDAO {

    private Connection connection;

    public FavoriteDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean addFavorite(Favorite favorite) {
        String sql = "INSERT INTO favorites (userId, servicevv_id, email, service_name, category_name, description, amount_from, amount_to, image1, image2, image3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, favorite.getUserId());
            stmt.setInt(2, favorite.getServiceVvId());
            stmt.setString(3, favorite.getEmail());
            stmt.setString(4, favorite.getServiceName());
            stmt.setString(5, favorite.getCategoryName());
            stmt.setString(6, favorite.getDescription());
            stmt.setInt(7, favorite.getAmountFrom());
            stmt.setDouble(8, favorite.getAmountTo());
            stmt.setString(9, favorite.getImage1());
            stmt.setString(10, favorite.getImage2());
            stmt.setString(11, favorite.getImage3());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Favorite> getFavoritesByUserId(int userId) {
        List<Favorite> favorites = new ArrayList<>();
        String sql = "SELECT * FROM favorites WHERE userId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Favorite favorite = new Favorite();
                    favorite.setFavoriteId(rs.getInt("favorite_id"));
                    favorite.setUserId(rs.getInt("userId"));
                    favorite.setServiceVvId(rs.getInt("servicevv_id"));
                    favorite.setEmail(rs.getString("email"));
                    favorite.setServiceName(rs.getString("service_name"));
                    favorite.setCategoryName(rs.getString("category_name"));
                    favorite.setDescription(rs.getString("description"));
                    favorite.setAmountFrom(rs.getInt("amount_from"));
                    favorite.setAmountTo(rs.getInt("amount_to"));
                    favorite.setImage1(rs.getString("image1"));
                    favorite.setImage2(rs.getString("image2"));
                    favorite.setImage3(rs.getString("image3"));
                    favorites.add(favorite);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return favorites;
    }

    public boolean deleteFavorite(int favoriteId) {
        String sql = "DELETE FROM favorites WHERE favorite_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, favoriteId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
