export type Investor = { id:string; user_id:string; full_name:string; email:string; phone?:string; joined_at:string; dollar_rate:number; is_admin:boolean; last_updated_by?:string; created_at:string }
export type Entry = { id:string; investor_id:string; entry_date:string; entry_time:string; amount_usdt:number; amount_pkr:number; dollar_rate:number; type:'Deposit'|'Reinvestment'|'Withdrawal'|'Profit'; note?:string; created_at:string }
export type Report = { id:string; investor_id:string; month:string; starting_capital:number; added_investment:number; profit_percent:number; profit_amount:number; withdrawn_amount:number; remaining_balance:number; created_at:string }
export type Note = { id:string; investor_id:string; note:string; created_at:string }
