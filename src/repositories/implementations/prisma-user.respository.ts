import { clientPrisma } from "../../client";
import { UserModel } from "../../models/user.model";
import { IUsersRepository } from "../interfaces/user.interface";

export class PrismaUserRepository implements IUsersRepository {
  async findById(user_id: string): Promise<UserModel> {
    const user = await clientPrisma.user.findFirst({
      where: {
        id: user_id,
        deleted_at: null,
      },
      include: {
        role: true,
        company: true,
        applied_demands: false,
        created_demand: false,
      },
    });

    return user;
  }
  async findByEmail(email: string): Promise<UserModel> {
    const user = await clientPrisma.user.findFirst({
      where: {
        email: email,
        deleted_at: null,
      },
      include: {
        role: true,
      },
    });

    return user;
  }
  async findAll(): Promise<UserModel[]> {
    const users = await clientPrisma.user.findMany({
      where: {
        deleted_at: null,
      },
      include: {
        role: true,
      },
      orderBy: {
        created_at: "desc",
      },
    });

    return users;
  }

  async findByPhoneNumber(phone: string): Promise<UserModel> {
    const userPhone = await clientPrisma.user.findFirst({
      where: {
        phone,
      },
      include: {
        role: true,
      },
    });
    return userPhone;
  }

  async save(user: UserModel): Promise<UserModel> {
    const userCreated = await clientPrisma.user.create({
      data: {
        name: user.name,
        email: user.email,
        password: user.password,
        phone: user.phone,
        role: {
          connect: {
            id: user.role_id,
          },
        },
      },
    });

    return userCreated;
  }

  async confirmEmail(user_id: string): Promise<UserModel> {
    const user = await clientPrisma.user.update({
      where: {
        id: user_id,
      },
      data: {
        is_active: true,
        email_verificated_at: new Date(),
      },
    });

    return user;
  }
}
