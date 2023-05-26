import { v4 as uuid } from "uuid";
import { UserModel } from "./user.model";

export class CompanyModel {
  public readonly id: string;
  public document?: string;
  public company_name: string;
  public trading_name: string;
  public cnae?: string;
  public revenue?: string;
  public type_port?: string;
  public type: number;
  public company_type: "common" | "approved";
  public company_interest: string;
  public phone_company?: string;
  public email_company?: string;
  public status_payment: boolean;
  public first_login: boolean;
  public presentation_file?: string;
  public presentation_url?: string;
  public attachment_url?: string;
  public attachment_file?: string;
  public service_region?: string;
  public average_revenue: number;
  public collaborators: number;
  public type_establishment?: string;
  public main_client?: string;
  public main_equipment?: string;
  public photo_company?: string;
  public photo_company_main?: string;
  public photo_company_default_first?: string;
  public presentation_file_photo?: string;
  public company_website?: string;
  public company_evaluation?: string;
  public tag_type?: string;
  public linkedin?: string;
  public facebook?: string;
  public instagram?: string;
  public share_capital?: number;
  public contact_name?: string;
  public user_id: string;
  public created_at?: Date;
  public updated_at?: Date;
  public deleted_at?: Date;

  public user?: UserModel;

  constructor(props: Omit<CompanyModel, "id">, id?: string) {
    Object.assign(this, props);

    if (!id) {
      this.id = uuid();
    }
  }
}
