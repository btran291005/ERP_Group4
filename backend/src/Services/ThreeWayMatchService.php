<?php

namespace App\Services;

use App\Core\Database;

/**
 * Implements the matching logic described on Screen 6.1 (3-Way Match
 * Verification): a line is Matched when
 *   InvoicedQty <= SUM(ReceivedQty) for that PODetailID
 *   AND UnitPrice(PO) == UnitPrice(Invoice)
 *   AND TaxAmount(PO) == TaxAmount(Invoice)
 */
class ThreeWayMatchService
{
    public function matchInvoice(string $invoiceId): array
    {
        $pdo = Database::connection();

        $stmt = $pdo->prepare(
            'SELECT id.InvoiceDetailID, id.PODetailID, id.InvoicedQty, id.UnitPrice AS InvUnitPrice,
                    id.TaxAmount AS InvTaxAmount,
                    pod.Quantity AS OrderedQty, pod.UnitPrice AS POUnitPrice, pod.TaxAmount AS POTaxAmount,
                    COALESCE((SELECT SUM(grd.ReceivedQty) FROM Goods_Receipt_Detail grd
                              WHERE grd.PODetailID = pod.PODetailID), 0) AS TotalReceivedQty
             FROM Invoice_Detail id
             JOIN Purchase_Order_Detail pod ON pod.PODetailID = id.PODetailID
             WHERE id.InvoiceID = ?'
        );
        $stmt->execute([$invoiceId]);
        $lines = $stmt->fetchAll();

        $results = [];
        foreach ($lines as $line) {
            $qtyOk   = $line['InvoicedQty'] <= $line['TotalReceivedQty'];
            $priceOk = bccomp($line['InvUnitPrice'], $line['POUnitPrice'], 2) === 0;
            $taxOk   = bccomp($line['InvTaxAmount'], $line['POTaxAmount'], 2) === 0;

            $results[] = [
                'InvoiceDetailID' => $line['InvoiceDetailID'],
                'matched'         => $qtyOk && $priceOk && $taxOk,
                'qtyOk'           => $qtyOk,
                'priceOk'         => $priceOk,
                'taxOk'           => $taxOk,
            ];
        }

        return $results;
    }
}
