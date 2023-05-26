import cors from "cors";
import express from "express";
import { authRoutes } from "./routes/auth.routes";

if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

// instanciando o express
const app = express();

// adicionando o middleware de cors
app.use(cors());

// adicionando o middleware de urlencoded
app.use(express.urlencoded({ extended: true }));

/// adicionando o middleware de json
app.use(express.json());

// adicionando rotas de autenticação
app.use("/api/auth", authRoutes);

export { app };
