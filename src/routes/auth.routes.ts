import { Request, Response, Router } from "express";

export const authRoutes = Router();

// efetua o login do usuário
authRoutes.route("/login").post((request: Request, response: Response) => {
  return response.json({
    message: "Hello World!",
  });
});
