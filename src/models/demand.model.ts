import { v4 as uuid } from "uuid";
import { UserModel } from "./user.model";

export class DemandModel {
  public readonly id: string;
  public title: string;
  public annotations: string;
  public deadline: Date;
  public city_id: string;
  public created_by_user_id: string;
  public category_id: string;
  public subcategory_id: string;
  public deleted_reason?: string;
  public file_url?: string;
  public file_name?: string;
  public status: boolean;
  public validated: boolean;
  public created_at?: Date;
  public updated_at?: Date;
  public deleted_at?: Date;

  public created_by_user?: UserModel;

  constructor(props: Omit<DemandModel, "id">, id?: string) {
    Object.assign(this, props);

    if (!id) {
      this.id = uuid();
    }
  }
}
