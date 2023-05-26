import { v4 as uuid } from "uuid";
import { CompanyModel } from "./company.model";
import { DemandHasBuyerModel } from "./demand-has-buyer.model";
import { DemandModel } from "./demand.model";
import { RoleModel } from "./role.model";

export class UserModel {
  public readonly id: string;
  public name: string;
  public email: string;
  public phone?: string;
  public role_id: string;
  public step_register: number;
  public is_active: boolean;
  public type_company: "company" | "industry";
  public verify_register: boolean;
  public email_verificated_at?: Date;
  public password: string;
  public remember_token?: string;
  public accepted_terms: boolean;
  public date_accept_terms?: Date;
  public created_at?: Date;
  public updated_at?: Date;
  public deleted_at?: Date;
  public role: RoleModel;
  public company?: CompanyModel;
  public created_demand?: DemandModel[];
  public applied_demands?: DemandHasBuyerModel[];

  constructor(props: Omit<UserModel, "id">, id?: string) {
    Object.assign(this, props);

    if (!id) {
      this.id = uuid();
    }
  }
}
