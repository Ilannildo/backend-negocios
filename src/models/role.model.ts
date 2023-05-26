import { v4 as uuid } from "uuid";
import { UserModel } from "./user.model";

export class RoleModel {
  public readonly id: string;
  public name: string;
  public register_user: boolean;
  public delete_user: boolean;
  public edit_user: boolean;
  public view_user: boolean;
  public created_at?: Date;
  public updated_at?: Date;
  public deleted_at?: Date;

  public users: UserModel[];

  constructor(props: Omit<RoleModel, "id">, id?: string) {
    Object.assign(this, props);

    if (!id) {
      this.id = uuid();
    }
  }
}
