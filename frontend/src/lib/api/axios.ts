import axios from "axios";

const apiClient = axios.create({
  baseURL: "http://localhost:3000",
  headers: {
    "Content-Type": "application/json",
  },
  // 必要に応じてタイムアウトなどの設定を追加
  timeout: 5000,
});

export default apiClient;
