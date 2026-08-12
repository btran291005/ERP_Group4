<?php

namespace App\Services;

/**
 * Computes CostScore / QualityScore / DeliveryScore / TotalScore for the
 * Supplier_Evaluation table shown on Screen 2.3. Weights are a placeholder —
 * confirm the real weighting formula with the business owner before demo.
 */
class EvaluationScoreService
{
    private const WEIGHT_COST     = 0.4;
    private const WEIGHT_QUALITY  = 0.35;
    private const WEIGHT_DELIVERY = 0.25;

    public function totalScore(float $costScore, float $qualityScore, float $deliveryScore): float
    {
        return round(
            $costScore * self::WEIGHT_COST
            + $qualityScore * self::WEIGHT_QUALITY
            + $deliveryScore * self::WEIGHT_DELIVERY,
            2
        );
    }
}
