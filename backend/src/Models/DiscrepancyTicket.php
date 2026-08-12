<?php

namespace App\Models;

class DiscrepancyTicket extends BaseModel
{
    protected static string $table = "Discrepancy_Ticket";
    protected static string $primaryKey = "TicketID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
