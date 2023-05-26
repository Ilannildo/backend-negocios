import { DemandModel } from "./demand.model";
import { UserModel } from "./user.model";

export class DemandHasBuyerModel {
  public demand_id: string;
  public buyer_id: string;

  public buyer: UserModel;
  public demand: DemandModel;

  constructor(props: DemandHasBuyerModel) {
    Object.assign(this, props);
  }
}
